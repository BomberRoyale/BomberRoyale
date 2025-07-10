"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const dao_1 = __importDefault(require("./../Models/dao"));
const dao = new dao_1.default();
class Login {
    VeirificandoLogin(event, usuario, senha, socket) {
        var data;
        if (event == "verificaLogin") {
            dao.login.logarUsu(usuario, senha)
                .then(([result]) => {
                var texto = JSON.parse(JSON.stringify(result));
                if (texto.length > 0) {
                    var a = texto[0]["status"];
                    data = {
                        ev: "Confirmado",
                        valor: a,
                        situacao: true
                    };
                    console.log(`${data.ev} - ${data.valor} usuário `);
                }
                else {
                    a = 0;
                    data = {
                        ev: "Negado",
                        valor: a,
                        situacao: false
                    };
                    console.log("Não cadastrado");
                }
                socket.emit("LOGIN", data);
            }).catch(err => {
                console.log(err);
                data = {
                    ev: "Error",
                    valor: -1,
                    situacao: false
                };
                socket.emit("LOGIN", data);
            });
        }
    }
}
exports.default = Login;
