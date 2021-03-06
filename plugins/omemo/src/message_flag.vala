using Xmpp;

namespace Dino.Plugins.Omemo {

public class MessageFlag : Message.MessageFlag {
    public const string id = "omemo";

    public bool decrypted = false;

    public static MessageFlag? get_flag(Message.Stanza message) {
        return (MessageFlag) message.get_flag(NS_URI, id);
    }

    public override string get_ns() {
        return NS_URI;
    }

    public override string get_id() {
        return id;
    }
}

}