# asm-trail

A Simple Trail on Assembly.

`nasm` could be Installed via `apt`.

1. Compilation

    ```sh
    $ nasm ./init-01.asm -f elf64 [-o ./init-01.o]
    ```

2. Linking

    ```sh
    $ ld -s ./init-01.o -o ./init-01.out
    ```

3. Execution

    ```sh
    $ ./init-01.out
    Holax, sekai!
    39
    Sharing (the World)
    We're Sharing an Endless Love
    ```

    (The part in brackets`()` is User's input.)
