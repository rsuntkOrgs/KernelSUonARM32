alias bk := build_ksud
alias bm := build_manager

build_ksud:
    cross build --target armv7-linux-androideabi --release --manifest-path ./userspace/ksud/Cargo.toml

build_manager: build_ksud
    cp userspace/ksud/target/armv7-linux-androideabi/release/ksud manager/app/src/main/jniLibs/armeabi-v7a/libksud.so
    cd manager && ./gradlew aDebug

clippy:
    cargo fmt --manifest-path ./userspace/ksud/Cargo.toml
    cross clippy --target armv7-linux-androideabi --release --manifest-path ./userspace/ksud/Cargo.toml
