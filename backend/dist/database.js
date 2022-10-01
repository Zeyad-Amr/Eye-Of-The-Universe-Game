"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
var mongoose_1 = __importDefault(require("mongoose"));
var Schema = mongoose_1.default.Schema;
var User = new Schema({
    username: { type: String, required: true, unique: true },
    password: { type: String, required: true },
    level: { type: Number, default: 1 },
    score: { type: Number, default: 0 },
    black_holes: {
        discovery: {
            score: { type: Number, default: 0 },
        },
        puzzle: {
            level1: {
                time: { type: Number, default: 0 },
                score: { type: Number, default: 0 },
            },
            level2: {
                time: { type: Number, default: 0 },
                score: { type: Number, default: 0 },
            },
            level3: {
                time: { type: Number, default: 0 },
                score: { type: Number, default: 0 },
            },
        },
        cards: {
            level1: {
                time: { type: Number, default: 0 },
                score: { type: Number, default: 0 },
                trials: { type: Number, default: 0 },
            },
            level2: {
                time: { type: Number, default: 0 },
                score: { type: Number, default: 0 },
                trials: { type: Number, default: 0 },
            },
            level3: {
                time: { type: Number, default: 0 },
                score: { type: Number, default: 0 },
                trials: { type: Number, default: 0 },
            },
        },
    },
    galaxies: {
        discovery: String,
        puzzle: {
            level1: {
                time: { type: Number, default: 0 },
                score: { type: Number, default: 0 },
            },
            level2: {
                time: { type: Number, default: 0 },
                score: { type: Number, default: 0 },
            },
            level3: {
                time: { type: Number, default: 0 },
                score: { type: Number, default: 0 },
            },
        },
        cards: {
            level1: {
                time: { type: Number, default: 0 },
                score: { type: Number, default: 0 },
                trials: { type: Number, default: 0 },
            },
            level2: {
                time: { type: Number, default: 0 },
                score: { type: Number, default: 0 },
                trials: { type: Number, default: 0 },
            },
            level3: {
                time: { type: Number, default: 0 },
                score: { type: Number, default: 0 },
                trials: { type: Number, default: 0 },
            },
        },
    },
    star_formation: {
        discovery: String,
        puzzle: {
            level1: {
                time: { type: Number, default: 0 },
                score: { type: Number, default: 0 },
            },
            level2: {
                time: { type: Number, default: 0 },
                score: { type: Number, default: 0 },
            },
            level3: {
                time: { type: Number, default: 0 },
                score: { type: Number, default: 0 },
            },
        },
        cards: {
            level1: {
                time: { type: Number, default: 0 },
                score: { type: Number, default: 0 },
                trials: { type: Number, default: 0 },
            },
            level2: {
                time: { type: Number, default: 0 },
                score: { type: Number, default: 0 },
                trials: { type: Number, default: 0 },
            },
            level3: {
                time: { type: Number, default: 0 },
                score: { type: Number, default: 0 },
                trials: { type: Number, default: 0 },
            },
        },
    },
    exoplanets: {
        discovery: String,
        puzzle: {
            level1: {
                time: { type: Number, default: 0 },
                score: { type: Number, default: 0 },
            },
            level2: {
                time: { type: Number, default: 0 },
                score: { type: Number, default: 0 },
            },
            level3: {
                time: { type: Number, default: 0 },
                score: { type: Number, default: 0 },
            },
        },
        cards: {
            level1: {
                time: { type: Number, default: 0 },
                score: { type: Number, default: 0 },
                trials: { type: Number, default: 0 },
            },
            level2: {
                time: { type: Number, default: 0 },
                score: { type: Number, default: 0 },
                trials: { type: Number, default: 0 },
            },
            level3: {
                time: { type: Number, default: 0 },
                score: { type: Number, default: 0 },
                trials: { type: Number, default: 0 },
            },
        },
    },
    early_universe: {
        discovery: String,
        puzzle: {
            level1: {
                time: { type: Number, default: 0 },
                score: { type: Number, default: 0 },
            },
            level2: {
                time: { type: Number, default: 0 },
                score: { type: Number, default: 0 },
            },
            level3: {
                time: { type: Number, default: 0 },
                score: { type: Number, default: 0 },
            },
        },
        cards: {
            level1: {
                time: { type: Number, default: 0 },
                score: { type: Number, default: 0 },
                trials: { type: Number, default: 0 },
            },
            level2: {
                time: { type: Number, default: 0 },
                score: { type: Number, default: 0 },
                trials: { type: Number, default: 0 },
            },
            level3: {
                time: { type: Number, default: 0 },
                score: { type: Number, default: 0 },
                trials: { type: Number, default: 0 },
            },
        },
    },
});
var connection = mongoose_1.default
    .connect('mongodb+srv://ggez:ggez@cluster0.w7pfze1.mongodb.net/?retryWrites=true&w=majority')
    .then(function () {
    console.log('Connected Successfully');
})
    .catch(function (err) {
    console.log('connection failed');
});
var my_model = mongoose_1.default.model('USerInfo', User);
exports.default = my_model;
