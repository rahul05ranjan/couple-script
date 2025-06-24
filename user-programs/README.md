# User Programs Directory

This directory is for your CoupleScript programs when using Docker.

## Usage

When running CoupleScript in Docker, you can place your `.couple` files here and they will be accessible from within the container.

### Example

1. Create a file `my_program.couple` in this directory
2. Run it with: `./docker-run.sh run my_program.couple` (Linux/Mac) or `docker-run.bat run my_program.couple` (Windows)

### Sample Program

Create a file called `test.couple` with this content:

```couplescript
marry name "Docker User"
remember "Hello from CoupleScript in Docker, " + name + "!"

argue love:
    remember "CoupleScript is running perfectly in Docker! 💕"
```

Then run it with:
- Linux/Mac: `./docker-run.sh run test.couple`
- Windows: `docker-run.bat run test.couple`
