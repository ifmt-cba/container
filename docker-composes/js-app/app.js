const express = require("express");
const {createClient: createRedisClient} = require("redis");

(async function () {

    const app = express();

    const redisClient = createRedisClient({
        url: `redis://redis:6379`
    });

    await redisClient.connect();

    app.get("/", async (request, response) => {
        const counterValue = await redisClient.get("counter");
        const newCounterValue = ((parseInt(counterValue) || 0) + 1);
        await redisClient.set("counter", newCounterValue);
        response.send(`Page loads: ${newCounterValue}`);
    });

    app.listen(80);

})();
