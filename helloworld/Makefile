GO=go
OS=linux
ARCH=riscv64

CHIPYARD=/scratch/joonho.whangbo/coding/chipyard
FIREMARSHAL=$(CHIPYARD)/software/firemarshal
MARSHAL=$(FIREMARSHAL)/marshal

TARGET=helloworld
TARGET_RISCV=$(TARGET).riscv
TARGET_X86=$(TARGET).x86
ALL_TARGETS=$(TARGET_X86) $(TARGET_RISCV)
SOURCE_FILES=helloworld.go

.PHONY: all
all: $(ALL_TARGETS)

$(TARGET_RISCV): $(SOURCE_FILES)
	GOOS=$(OS) GOARCH=$(ARCH) $(GO) build -o $@ $^

$(TARGET_X86): $(SOURCE_FILES)
	$(GO) build -o $@ $^

.PHONY: clean
clean:
	rm -f $(TARGET_X86) overlay/$(TARGET_RISCV)
