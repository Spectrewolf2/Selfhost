### Ollama via Docker


```
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey \
    | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg
curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list \
    | sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' \
    | sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
sudo apt-get update
```

If you have a NVIDIA graphics card run these commands:
```
sudo apt-get install -y nvidia-container-toolkit
```

```
sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker
```
```
sudo docker run -d --gpus=all -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama
```

### Ollama as a Docker container is now running and can be accessed in your browser by typing localhost:11434.

To run Ollama using Docker with AMD GPUs, use the `rocm` tag and the following command:
```
docker run -d --device /dev/kfd --device /dev/dri -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama:rocm
```

### Ollama as a Docker container is now running and can be accessed in your browser by typing localhost:11434.


### Begin: Running Open-Web UI to interface via a web browser.

```
sudo docker run -d --network=host -v open-webui:/app/backend/data -e OLLAMA_BASE_URL=http://127.0.0.1:11434 --name open-web-ui --restart always ghcr.io/open-webui/open-webui:main
```

### Open-Web UI is now running and you can reach it via localhost:8080

 1. Create an email and password by clicking Sign up
 2. Enter a Name, Email, and Password and Create your account. This account will be used to manage Ollama. (Open WebUI does not make any external connections, and your data stays securely on your locally hosted server)
 3. On your Ubuntu system run the following command:

```
sudo docker exec -it ollama ollama run llama3
```

Use /bye to exit the AI model.
