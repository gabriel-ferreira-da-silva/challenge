from AutoFile import AutoFile
from datetime import datetime, timedelta


autoFile = AutoFile()
# Descomente e especifique a janela de tempo aqui
# autoFile.timewindow = datetime.now() - timedelta(minutes=1) 
autoFile.routine()