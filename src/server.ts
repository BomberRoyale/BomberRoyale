import WebSocket from "ws";
import Socket2 from "./core/socket2";
import Chamadas from "./Chamadas/chamadas";
import * as ntpClient from 'ntp-client';

//import d_m3 from "./Models/database_model3";
//const database_model2 = require("./Models/database_model2");

// Classe onde estaram as funções determinadas esperando serem chamadas pelo servidor.
const chamadas = new Chamadas();

const socketPort = 3000;

const server = new WebSocket.Server({port:socketPort}, () =>{
    console.log(`WebeSoket escutando na porta ${socketPort}...`)
});

/*const database_model3 = new d_m3();
database_model2.connect();
database_model3.connect();*/

// Comandos para serem ouvidos pelo cliente.
server.on("connection", ws => {
    const socket = new Socket2(ws, { open: true });

    console.log("connectado: " + socket.id);

    //login e cadastro.
    socket.on("LOGIN", (event, callback) => {
        if(event.usuario == "123321"){
            var data: any;
            data = {
                ev: "Confirmado",
                valor: "LoginTeste",
                situacao: true
            };
            socket.emit("LOGIN", data);
        }
        else{
            chamadas.login.VeirificandoLogin(event.ev, event.usuario, event.senha, socket);
        }
        
    })

    socket.on("BUSCA_HORARIO", (event) => {
        let data: any;
        // Exibe o horário, para não seguir do sistema, mas verificar onde colocar depois.
        ntpClient.getNetworkTime("pool.ntp.org", 123, (err, date: any) => {
            if (err) {
                console.error("Erro ao obter horário via NTP:", err);
                data = {
                    ev: "Horário",
                    valor: "Erro no Horário",
                    situacao: false
                }
            }else{
                const dataLocal = new Date(date.toLocaleString("en-US", { timeZone: "America/Cuiaba" }));
                const dia = String(dataLocal.getDate()).padStart(2, '0');
                const mes = String(dataLocal.getMonth() + 1).padStart(2, '0');
                const ano = dataLocal.getFullYear();
                const hora = String(dataLocal.getHours()).padStart(2, '0');
                const minuto = String(dataLocal.getMinutes()).padStart(2, '0');
                const segundo = String(dataLocal.getSeconds()).padStart(2, '0');

                // Criando uma data com 1º de janeiro do mesmo ano, no mesmo fuso
                const inicioDoAno = new Date(dataLocal.getFullYear(), 0, 1);
                // Calculando a diferença em milissegundos
                const diffEmMs = dataLocal.getTime() - inicioDoAno.getTime();
                // Convertendo pra dias e arredondando
                const diaDoAno = Math.floor(diffEmMs / (1000 * 60 * 60 * 24)) + 1;
                
                const horarioFormatado = `${diaDoAno},${dia}/${mes}/${ano},${hora}:${minuto}:${segundo}${event?.qualUsar ? ',' + event.qualUsar : ''}`;
                             
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

    //inicando player criando linhas nas tabelas e buscando dados
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

        //missoesDiaria_usu
        if (event.ev == "missoesDiaria_usu") {
            chamadas.verifTabBDExiEBuscaDados.TabelaMissoesDiariaUsu(event.usuario, socket);
        } else if (event.ev == "data_base") {
            chamadas.verifTabBDExiEBuscaDados.DataBaseMDiarias(event, socket);
        }

    });

    //Atualizando Tabelas
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
        if(event.ev == "SalvaXpOnlineFimJogo"){
            chamadas.atualizaTab.AtuaGenericoUsu(event, socket);
        }
        if(event.ev == "AtualizaNivelOnline"){
            chamadas.atualizaTab.AtuaUpNivel(event, socket);
        }
    });

    socket.on("disconnect", event => {
        console.log("Desconectado");
    });

});

