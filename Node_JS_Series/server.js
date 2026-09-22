const express = require('express')

const app = express()
const port = 3000

app.use(express.json())
app.use((req, res, next) => {
    res.header('Access-Control-Allow-Origin', '*')
    res.header('Access-Control-Allow-Methods', 'GET,POST,PUT,DELETE,OPTIONS')
    res.header('Access-Control-Allow-Headers', 'Content-Type')
    next()
})

let users = [
    {
        id: 1,
        name: 'Ali',
        email: 'ali@example.com',
        age: 22
    }
]

const findUser = (id) => users.find((user) => user.id === Number(id))

const validateUser = (user) => {
    if (!user || typeof user.name !== 'string' || !user.name.trim()) {
        return 'name is required and must be a non-empty string'
    }

    if (typeof user.email !== 'string' || !user.email.trim()) {
        return 'email is required and must be a non-empty string'
    }

    if (!Number.isInteger(user.age) || user.age < 0) {
        return 'age is required and must be a non-negative integer'
    }

    return null
}

app.get('/', (req, res) => {
    res.json({ message: 'API is working' })
})

app.get('/api/users', (req, res) => {
    res.json(users)
})

app.get('/api/users/:id', (req, res) => {
    const user = findUser(req.params.id)

    if (!user) {
        return res.status(404).json({ message: 'User not found' })
    }

    res.json(user)
})

app.post('/api/users', (req, res) => {
    const validationError = validateUser(req.body)

    if (validationError) {
        return res.status(400).json({ message: validationError })
    }

    const user = {
        id: users.length ? Math.max(...users.map((item) => item.id)) + 1 : 1,
        name: req.body.name.trim(),
        email: req.body.email.trim(),
        age: req.body.age
    }

    users.push(user)
    res.status(201).json(user)
})

app.put('/api/users/:id', (req, res) => {
    const userIndex = users.findIndex((user) => user.id === Number(req.params.id))

    if (userIndex === -1) {
        return res.status(404).json({ message: 'User not found' })
    }

    const validationError = validateUser(req.body)

    if (validationError) {
        return res.status(400).json({ message: validationError })
    }

    users[userIndex] = {
        id: users[userIndex].id,
        name: req.body.name.trim(),
        email: req.body.email.trim(),
        age: req.body.age
    }

    res.json(users[userIndex])
})

app.delete('/api/users/:id', (req, res) => {
    const userIndex = users.findIndex((user) => user.id === Number(req.params.id))

    if (userIndex === -1) {
        return res.status(404).json({ message: 'User not found' })
    }

    const [deletedUser] = users.splice(userIndex, 1)
    res.json({ message: 'User deleted successfully', user: deletedUser })
})

app.use((req, res) => {
    res.status(404).json({ message: 'Route not found' })
})

app.listen(port, () => {
    console.log(`Server is running successfully on port ${port}`)
})