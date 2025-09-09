import os
import shutil
from datetime import datetime, timedelta

class AutoFile:
    def __init__(self):
        self.SRC_DIR = "home/valcann/backupsFrom"
        self.DST_DIR = "home/valcann/backupsTo"
        self.LOG_SRC = "home/valcann/backupsFrom.log"
        self.LOG_DST = "home/valcann/backupsTo.log"
        self.timewindow = datetime.now() - timedelta(days=3)

    def get_file_dates(self, path):
        stat = os.stat(path)
        try:
            creation_time = datetime.fromtimestamp(stat.st_ctime)
        except:
            creation_time = None
        modification_time = datetime.fromtimestamp(stat.st_mtime)
        return creation_time, modification_time
    
    def routine(self):
        with open(self.LOG_SRC, 'a') as log_src, open(self.LOG_DST, 'a') as log_dst:
            for filename in os.listdir(self.SRC_DIR):
                src_file = os.path.join(self.SRC_DIR, filename)
                
                if os.path.isfile(src_file):
                    size = os.path.getsize(src_file)
                    creation_time, modification_time = self.get_file_dates(src_file)

                    log_src.write(f"Nome: {filename} | Tamanho: {size} bytes | "
                                f"Criacao: {creation_time} | Modificacao: {modification_time}\n")

                    if creation_time < self.timewindow:
                        os.remove(src_file)
                    else:
                        dst_file = os.path.join(self.DST_DIR, filename)
                        shutil.copy2(src_file, dst_file)

                        dst_size = os.path.getsize(dst_file)
                        dst_ctime, dst_mtime = self.get_file_dates(dst_file)
                        log_dst.write(f"Nome: {filename} | Tamanho: {dst_size} bytes | "
                                    f"Criacao: {dst_ctime} | Modificacao: {dst_mtime}\n")
