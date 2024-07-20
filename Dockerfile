#Use a Ubuntu image
FROM ubuntu:latest

# Set the PATH environment variable
ENV PATH $PATH:/usr/games

#Install packages
RUN apt update && apt install fortune-mod cowsay netcat-openbsd -y && rm -rf /var/lib/apt/lists/*

#Copy the Wisecow script into the container
COPY wisecow.sh /usr/local/bin

#Make the script executable
RUN chmod +x /usr/local/bin/wisecow.sh

#Expose the port the app runs on
EXPOSE 4499

#RUN the Script
CMD ["/usr/local/bin/wisecow.sh"]