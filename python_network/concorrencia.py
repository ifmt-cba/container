import threading
import time

# Função que será executada em uma thread separada
def tarefa(nome, tempo):
    print(f"Tarefa {nome} iniciada.")
    time.sleep(tempo) # Simula uma operação de I/O (ex: leitura de arquivo)
    print(f"Tarefa {nome} concluída após {tempo}s.")

# Criando as threads
t1 = threading.Thread(target=tarefa, args=("A", 2))
t2 = threading.Thread(target=tarefa, args=("B", 4))

# Iniciando as threads
t1.start()
t2.start()

# Espera ambas as threads terminarem
t1.join()
t2.join()

print("Todas as tarefas finalizaram.")
