import express from 'express';
import { my_router, my_router2 } from './routes/userAPI';

const app = express();
// eslint-disable-next-line no-var
var port = process.env.PORT || 8080;

app.use('/userInfo', my_router);
app.use('/imgs', my_router2);

app.listen(port, (): void => {
    console.log(`http://localhost:${port}/userInfo`);
});

export default app;
