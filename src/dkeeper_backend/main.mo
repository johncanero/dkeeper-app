import List "mo:base/List";
import Debug "mo:base/Debug";

actor DKeeper {
    
    // Motoko Language = CRUD (Backend)
    public type Note = {
        title: Text;
        content: Text;
    };

    // Add stable so the list would persist
    stable var notes: List.List<Note> = List.nil<Note>();

    // CREATE
    public func createNote(titleText: Text, contentText: Text) {

        let newNote: Note = {
            title = titleText;
            content = contentText;
        };

        notes := List.push(newNote,  notes);
        Debug.print(debug_show(notes));
    };

    // QUERY = READ
    public query func readNotes(): async [Note] {
        return List.toArray(notes);
    };

    public query func readNotes(): async [Note] {
        return List.toArray(notes);
    };

    // DELETE 
    public func removeNote(id: Nat) {
        //take drop append
        let listFront = List.take(notes, id);
        let listBack = List.drop(notes, id + 1);
        notes := List.append(listFront, listBack);
    };
}