FROM fedora
WORKDIR /app
RUN dnf -y install openscad python gcc python3-devel && \
    dnf clean all

COPY get-pip.py .
RUN python3 get-pip.py

COPY requirements.txt .
RUN pip3 install -r requirements.txt

RUN useradd jovyan -p jovyan
USER jovyan
WORKDIR /home/jovyan/app

EXPOSE 8888
CMD ["jupyter", "lab", "--ip=0.0.0.0"]