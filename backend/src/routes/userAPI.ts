import { Router, Request, Response } from 'express';
import express from 'express';
import { my_model } from '../database';
import path from 'path';

const my_router = Router();
const my_router2 = Router();
my_router.use(express.json());
my_router2.use(express.json());
my_router.get('/', async (req: Request, res: Response) => {
    const user_username: string = req.query.username as string;
    const user_data = await my_model.find({ username: user_username });
    res.send(user_data);
});

my_router.post('/', async (req: Request, res: Response) => {
    await my_model.create(req.body);
    return res.status(200).send(req.body);
});

my_router.put('/', async (req: Request, res: Response) => {
    const user_username: string = req.query.username as string;
    await my_model.updateOne({ username: user_username }, req.body);
    return res.status(200).send(req.body);
});

my_router2.get('/', (req: Request, res: Response) => {
    const inst: string = req.query.inst as string;
    const filter: string = req.query.filter as string;
    res.sendFile(`${path.resolve()}/assets/${inst}_${filter}.png`);
});

export { my_router, my_router2 };
