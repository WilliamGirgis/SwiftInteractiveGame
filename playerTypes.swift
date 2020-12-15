import InteractiveFictionFramework

public protocol character {
    var name:String {set get}
    var bag :[String] {set get}
    var energy : Int {get set}
    var health : Int {get set}
    var damage :Int {get set}
   mutating func eat(argument:String) -> () // Function where each character restores a specific amount of Energy and Health
}



public struct scientist:character {
     public mutating func eat(argument:String) {
        if(argument == "apple") {
           self.health += 20
           self.energy += 15
        } else if(argument == "muschrooms") {
           self.health += 15
           self.energy += 20
        }
        
     }

    init(name:String) {
      self.name = name
    }
       public var damage :Int  = 5
       public var health:Int = 200
       public var energy = 100
       public var name :String 
       public var bag =  [String]() // The bag holds by the player, initialy empty
}


public  struct hunter:character {
   mutating public func eat(argument:String) {
        if(argument == "apple") {
           self.health += 5
           self.energy += 5
        } else if(argument == "muschrooms") {
           self.health += 5
           self.energy += 5
        }
 
      }

      init(name:String) {
      self.name = name
      
    }
      public var damage : Int = 7
       public var health : Int = 200
       public var energy = 150
       public var name : String
       public var bag =  [String]() // The bag holds by the player, initialy empty
}



public  struct cop:character { // Secret character that has high damage
   mutating public func eat(argument:String) {
        if(argument == "apple") {
           self.health += 5
           self.energy += 5
        } else if(argument == "muschrooms") {
           self.health += 5
           self.energy += 5
        }
 
      }

      init(name:String) {
      self.name = name
      
    }
      public var damage : Int = 25
       public var health : Int = 200
       public var energy = 150
       public var name : String
       public var bag =  [String]() // The bag holds by the player, initialy empty
}