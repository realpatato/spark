#include <iostream>
#include <SDL3/SDL.h>

int main() {
    if (SDL_Init(SDL_INIT_VIDEO) < 0) {
        std::cout << "SDL failed" << SDL_GetError() << std::endl;
        return 1;
    }

    SDL_Window* window = SDL_CreateWindow(
        "spark",
        800,
        600,
        0
    );

    if (!window) {
        std::cout << "Window failed" << SDL_GetError() << std::endl;
        return 1;
    }

    SDL_Delay(3000);

    SDL_DestroyWindow(window);
    SDL_Quit();

    return 0;
}