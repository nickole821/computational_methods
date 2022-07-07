# Adicionar uma descrição do script: who, how, where and why

# Adicionar os pacotes que vão ser usados
library()

# Adicionar os dados que serão lidos no script
input_file <- "data/nomedodocumento"
output_file <- "data/results"

  Se quiser puxar os dados de outro documento, usar source()

# Good practices
1. Never create a single script with all the analysis
    Each script statrs reading a particular input/data and ends writing results
2. Never save the workspace
3. Coding a variable that will not change
4. Commenting every step
5. The script must be able to be run in sequence fron start to finish
6. You should be able to erase the workspace mid-session and rebuild
7. Do not define functions inside the script. Put the functions in a separate script and folder /fct/edit.R and call via source()
8. Use concise and informative names
9. If you copy and paste more than three times its time to write a loop or a function






