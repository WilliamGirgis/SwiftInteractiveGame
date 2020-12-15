import InteractiveFictionFramework
public class ocean:Room{


     var npc : zMonster?

      override  init(name:String) {
        super.init(name:name)
        self.items = ["chest"]
        self.npc = zMonster()
    }
     var items  = [String]()
}