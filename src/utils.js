const { nanoid } = require ("nanoid");


// Esto para validar si el string es una URL valida.
function isValidUrl(url) {
    try {
        new URL(url);
        return true;
    } catch (error) {
        return false;
    }
}

// Esto es para generar el code corto.
function generateCode() {
    return nanoid(6);
}

module.exports = { isValidUrl, generateCode };