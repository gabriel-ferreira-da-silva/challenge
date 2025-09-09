# SEGUNDA QUESTÃO 🖥️🤖🗃️

Nesta branch a automação dos arquivos foi implementada em python e os diretórios especificados foram mockados dentro desta pasta da seguinte forma:

![](https://github.com/gabriel-ferreira-da-silva/challenge/blob/main/questao2/img.png?raw=true)

No arquivo AutoFile está  a classe de mesmo nome. Essa classe contem variáveis e implementa métodos que realizam as ações especificadas.

```
class AutoFile:
    def __init__(self):
        self.SRC_DIR = "home/valcann/backupsFrom"
        self.DST_DIR = "home/valcann/backupsTo"
        self.LOG_SRC = "home/valcann/backupsFrom.log"
        self.LOG_DST = "home/valcann/backupsTo.log"
        self.timewindow = datetime.now() - timedelta(days=3)
```

O arquivo autoscript.py chama a classe e executa sua principal função. Antes de rodar é possivel alterar os parâmetros do classe como a janela de tempo para excluir os arquivos. Se nada for alterado a janela será de 3 dias.

```

autoFile = AutoFile()
# Descomente e especifique a janela de tempo aqui
# autoFile.timewindow = datetime.now() - timedelta(minutes=1) 
autoFile.routine()
```

Por fim o script pode ser executado fazendo:

```
python autoscript.py
```

Para ver a implementação do script em shell vá para a branch questa2-with-shell.
