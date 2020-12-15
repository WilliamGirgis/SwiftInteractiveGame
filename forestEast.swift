import InteractiveFictionFramework
public class forestEast:Room {
   
   var npc :bear?

  override  init(name:String) {
        super.init(name:name)
        self.items = ["muschrooms","apple","wood"]    
    }

    var items = [String]()

    func popBear() -> (){ // Function to generate a Bear. It can appear every time you go in a direction
      var b :Int
      b = .random(in:0...10) // random generator
      if(((b == 1) || (b == 8) || (b == 5)) && (myConcreteGame.forEast.npc?.isAlive != true)) { // If the generator hits the arbitrary numbers AND the array is empty, we initiate the npc
        myConcreteGame.forEast.npc = bear(isAlive: true)
        print("A Bear appeared on the east side of the forest !")
      }
    }

}