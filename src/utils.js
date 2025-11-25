import { nanoid } from "nanoid";


// Esto para validar si el string es una URL valida.
export function isValidUrl(url) {
    try {
        new URL(url);
        return true;
    } catch (error) {
        return false;
    }
}

// Esto es para generar el code corto.
export function generateCode() {
    return nanoid(6);
}