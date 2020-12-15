import InteractiveFictionFramework
public class city:Room{

      override  init(name:String) {
        super.init(name:name)
        self.exits = [Direction:Room]()
    }

    var items = [AnyObject]()
}