GO=go
OS=linux
ARCH=riscv64
CHIPYARD=/scratch/joonho.whangbo/coding/chipyard
FIREMARSHAL=$(CHIPYARD)/software/firemarshal
MARSHAL=$(FIREMARSHAL)/marshal
TARGET=helloworld

$(TARGET): $(TARGET).go
	GOOS=$(OS) GOARCH=$(ARCH) $(GO) build $^

.PHONY: clean
clean:
	rm -f $(TARGET)


# .PHONY: run
# run:

