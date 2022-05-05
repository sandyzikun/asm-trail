# asm-trail

A Simple Trail on Assembly.

`nasm` could be Installed via `apt`.

1. Compilation

    ```sh
    $ nasm ./init.asm -f elf64 -o ./init.o
    ```

2. Linking

    ```sh
    $ ld -s ./init.o -o ./init.out
    ```

3. Execution

    ```sh
    $ ./init.out
    Holax, sekai!
    ```
