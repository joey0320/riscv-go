# RISC-V Based Webapp that runs on QeMU

## Usage

### 1. Build the webapp binary
```
cd webapp
make
```

### 2. Add curl to Build Root
```
cd webapp
apply br-add-curl.patch $CY/software/firemarshal/boards/default/distros/br/buildroot
```

### 3. Build firemarshal image
```
./marshal-build.sh webapp
```

### 4. Run QeMU
```
./run-qemu.sh webapp
```

### 5. Inside QeMU
```
curl localhost:8080
curl localhost:8080/bird
curl -d "species=a&description=b" localhost:8080/bird
curl localhost:8080/bird
```



