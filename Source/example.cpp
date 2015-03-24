#include <Renegade/Renegade.hpp>

using namespace rge;

int main() {

    Application app;

    Window window;
    window.Create (WindowSettings ());

    Context context;
    context.Create (&window, ContextSettings ());

    app.RegisterWindow  (&window);
    app.RegisterContext (&context);

    while (app.isRunning ()) {

        Event event;

        while (Event::PollEvents (event)) {

            switch (event.type) {

                case EventType::Close:
                case EventType::KeyDown:
                    app.Exit ();

                default:
                    break;
            }
        }
    }

    return 0;
}
