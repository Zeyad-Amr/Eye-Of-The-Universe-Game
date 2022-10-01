import mongoose from 'mongoose';

const Schema = mongoose.Schema;
const User = new Schema({
    username: { type: String, required: true, unique: true },
    password: { type: String, required: true },
    level: { type: Number, default: 1 },
    score: { type: Number, default: 0 },
    coins: { type: Number, default: 0 },
    level1: {
        discovery: {
            score: { type: Number, default: 0 },
        },
        puzzle: {
            time: { type: Number, default: 0 },
            score: { type: Number, default: 0 },
        },

        cards: {
            score: { type: Number, default: 0 },
            trials: { type: Number, default: 0 },
        },
        psf: {
            score: { type: Number, default: 0 },
        },
    },

    level2: {
        discovery: {
            score: { type: Number, default: 0 },
        },
        puzzle: {
            time: { type: Number, default: 0 },
            score: { type: Number, default: 0 },
        },

        cards: {
            score: { type: Number, default: 0 },
            trials: { type: Number, default: 0 },
        },
        psf: {
            score: { type: Number, default: 0 },
        },
    },

    level3: {
        discovery: {
            score: { type: Number, default: 0 },
        },
        puzzle: {
            time: { type: Number, default: 0 },
            score: { type: Number, default: 0 },
        },

        cards: {
            score: { type: Number, default: 0 },
            trials: { type: Number, default: 0 },
        },
        psf: {
            score: { type: Number, default: 0 },
        },
    },

    level4: {
        discovery: {
            score: { type: Number, default: 0 },
        },
        puzzle: {
            time: { type: Number, default: 0 },
            score: { type: Number, default: 0 },
        },

        cards: {
            score: { type: Number, default: 0 },
            trials: { type: Number, default: 0 },
        },
        psf: {
            score: { type: Number, default: 0 },
        },
    },

    level5: {
        discovery: {
            score: { type: Number, default: 0 },
        },
        puzzle: {
            time: { type: Number, default: 0 },
            score: { type: Number, default: 0 },
        },

        cards: {
            score: { type: Number, default: 0 },
            trials: { type: Number, default: 0 },
        },
        psf: {
            score: { type: Number, default: 0 },
        },
    },
});

const connection = mongoose
    .connect(
        'mongodb+srv://ggez:ggez@cluster0.w7pfze1.mongodb.net/?retryWrites=true&w=majority'
    )
    .then(() => {
        console.log('Connected Successfully');
    })
    .catch((err) => {
        console.log('connection failed');
    });

export const my_model = mongoose.model('USerInfo', User);
