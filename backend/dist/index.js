"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
var express_1 = __importDefault(require("express"));
var userAPI_1 = __importDefault(require("./routes/userAPI"));
var app = (0, express_1.default)();
// eslint-disable-next-line no-var
var port = process.env.PORT || 8080;
app.use('/userInfo', userAPI_1.default);
app.listen(port, function () {
    console.log('http://localhost:3000/userInfo');
});
exports.default = app;
