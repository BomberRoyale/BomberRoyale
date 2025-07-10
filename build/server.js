"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (k !== "default" && Object.prototype.hasOwnProperty.call(mod, k)) __createBinding(result, mod, k);
    __setModuleDefault(result, mod);
    return result;
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const ws_1 = __importDefault(require("ws"));
const socket2_1 = __importDefault(require("./core/socket2"));
const chamadas_1 = __importDefault(require("./Chamadas/chamadas"));
const ntpClient = __importStar(require("ntp-client"));
const chamadas = new chamadas_1.default();
const socketPort = 3000;
const server = new ws_1.default.Server({ port: socketPort }, () => {
    console.log(`WebeSoket escutando na porta ${socketPort}...`);
});
server.on("connection", ws => {
    const socket = new socket2_1.default(ws, { open: true });
    console.log("connectado: " + socket.id);
    socket.on("LOGIN", (event, callback) => {
        if (event.usuario == "123321") {
            var data;
            data = {
                ev: "Confirmado",
                valor: "LoginTeste",
                situacao: true
            };
            socket.emit("LOGIN", data);
        }
        else {
            chamadas.login.VeirificandoLogin(event.ev, event.usuario, event.senha, socket);
        }
    });
    socket.on("BUSCA_HORARIO", (event) => {
        let data;
        ntpClient.getNetworkTime("pool.ntp.org", 123, (err, date) => {
            if (err) {
                console.error("Erro ao obter horário via NTP:", err);
                data = {
                    ev: "Horário",
                    valor: "Erro no Horário",
                    situacao: false
                };
            }
            else {
                const dataLocal = new Date(date.toLocaleString("en-US", { timeZone: "America/Cuiaba" }));
                const dia = String(dataLocal.getDate()).padStart(2, '0');
                const mes = String(dataLocal.getMonth() + 1).padStart(2, '0');
                const ano = dataLocal.getFullYear();
                const hora = String(dataLocal.getHours()).padStart(2, '0');
                const minuto = String(dataLocal.getMinutes()).padStart(2, '0');
                const segundo = String(dataLocal.getSeconds()).padStart(2, '0');
                const inicioDoAno = new Date(dataLocal.getFullYear(), 0, 1);
                const diffEmMs = dataLocal.getTime() - inicioDoAno.getTime();
                const diaDoAno = Math.floor(diffEmMs / (1000 * 60 * 60 * 24)) + 1;
                const horarioFormatado = `${diaDoAno},${dia}/${mes}/${ano},${hora}:${minuto}:${segundo}`;
                data = {
                    ev: "Horário",
                    valor: horarioFormatado,
                    situacao: true
                };
            }
            socket.emit("BUSCA_HORARIO", data);
        });
    });
    socket.on("CADASTRO_USUARIO", (event) => {
        chamadas.cadastroUsu.Cadastrando(event.ev, event.usuario, event.senha, event.nascimento, socket);
    });
    socket.on("VERIFICA_TABELA_BD", (event) => {
        if (event.ev == "xp_usu") {
            chamadas.verifTabBDExiEBuscaDados.TabelaXpUsu(event.usuario, socket);
        }
        if (event.ev == "energiaM_usu") {
            chamadas.verifTabBDExiEBuscaDados.TabelaEnergiaMUsu(event.usuario, socket);
        }
        if (event.ev == "moedas_usu") {
            chamadas.verifTabBDExiEBuscaDados.TabelaMoedasUsu(event.usuario, socket);
        }
        if (event.ev == "dadosDeJogo_usu") {
            chamadas.verifTabBDExiEBuscaDados.TabelaDadosDeJogoUsu(event.usuario, socket);
        }
        if (event.ev == "missoesDiaria_tab") {
            chamadas.buscaDadosTabelas.MissoesDiariasTab(event, socket);
        }
        if (event.ev == "updateMissoesDiariaUsu") {
            chamadas.atualizaTab.AtuaMissoesDiariasUsu(event, socket);
        }
        if (event.ev == "missoesDiaria_usu") {
            chamadas.verifTabBDExiEBuscaDados.TabelaMissoesDiariaUsu(event.usuario, socket);
        }
        else if (event.ev == "data_base") {
            chamadas.verifTabBDExiEBuscaDados.DataBaseMDiarias(event, socket);
        }
    });
    socket.on("ATUALIZA_TABELAS", (event) => {
        if (event.ev == "energiaM_usu") {
            chamadas.atualizaTab.AtuaGenericoUsu(event, socket);
        }
        if (event.ev == "missoesDiaria_usu") {
            chamadas.atualizaTab.AtuaGenericoUsu(event, socket);
        }
        if (event.ev == "moedas_usu") {
            chamadas.atualizaTab.AtuaGenericoUsu(event, socket);
        }
        if (event.ev == "SalvaXpOnlineFimJogo") {
            chamadas.atualizaTab.AtuaGenericoUsu(event, socket);
        }
        if (event.ev == "AtualizaNivelOnline") {
            chamadas.atualizaTab.AtuaUpNivel(event, socket);
        }
    });
    socket.on("disconnect", event => {
        console.log("Desconectado");
    });
});
