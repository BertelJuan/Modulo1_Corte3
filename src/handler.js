const { DynamoDBClient, PutItemCommand } = require ("@aws-sdk/client-dynamodb");
const { marshall } = require ("@aws-sdk/util-dynamodb");
const { isValidUrl, generateCode } = require ("./utils.js")

const client = new DynamoDBClient({});

exports.handler = async (event) => {
    try {
        const body = JSON.parse(event.body);
        const originalUrl = body.url;

        if (!originalUrl || !isValidUrl(originalUrl)) {
            return {
                statusCode: 400,
                body: JSON.stringify({ error: "URL invalida" })
            };
        }

        // Aqui se genera el code corto
        const code = generateCode();

        const item = {
            code: code,
            originalUrl: originalUrl,
            createdAt: Date.now(),
            visits: 0
        };

        await client.send(
            new PutItemCommand({
                TableName: process.env.TABLE_NAME,
                Item: marshall(item)
            })
        );

        // URL final acortada aqui
        const shortUrl = `${process.env.BASE_URL}/${code}`;

        return {
            statusCode: 200,
            body: JSON.stringify({
                shortUrl,
                code,
                originalUrl
            })
        };
    } catch (error) {
        console.error("Error: ", error);

        return {
            statusCode: 500,
            body: JSON.stringify({ error: "Error interno" })
        };
    }
};