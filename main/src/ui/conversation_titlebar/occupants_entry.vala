using Gtk;

using Dino.Entities;

namespace Dino.Ui {

class OccupantsEntry : Plugins.ConversationTitlebarEntry {
    public override string id { get { return "occupants"; } }

    StreamInteractor stream_interactor;
    Window window;

    public OccupantsEntry(StreamInteractor stream_interactor, Window window) {
        this.stream_interactor = stream_interactor;
        this.window = window;
    }

    public override double order { get { return 3; } }
    public override Plugins.ConversationTitlebarWidget get_widget() {
        return new OccupantsWidget(stream_interactor, window) { visible=true };
    }
}

class OccupantsWidget : MenuButton, Plugins.ConversationTitlebarWidget {

    private Conversation? conversation;
    private StreamInteractor stream_interactor;
    private Window window;

    public OccupantsWidget(StreamInteractor stream_interactor, Window window) {

        image = new Image.from_icon_name("system-users-symbolic", IconSize.MENU);

        this.stream_interactor = stream_interactor;
        this.window = window;
        set_use_popover(true);
    }

    public new void set_conversation(Conversation conversation) {
        this.conversation = conversation;

        visible = conversation.type_ == Conversation.Type.GROUPCHAT;
        if (conversation.type_ == Conversation.Type.GROUPCHAT) {
            OccupantMenu.View menu = new OccupantMenu.View(stream_interactor, window, conversation);
            set_popover(menu);
        }
    }
}

}