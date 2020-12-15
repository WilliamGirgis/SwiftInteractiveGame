import InteractiveFictionFramework
public class forestWest:Room {

    override  init(name:String) {
        super.init(name:name)
        self.items = ["muschrooms","apple","wood"]
    }

    var items = [String]()

}