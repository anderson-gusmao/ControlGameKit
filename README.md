[![Build Status](https://travis-ci.org/anderson-gusmao/ControlGameKit.svg?branch=master)](https://travis-ci.org/anderson-gusmao/ControlGameKit)

# ControlGameKit
This project is a joystick abstraction using the reactive Combine framework based on the GameController framework. The idea was to encapsulate the events of the joystick using publishers to simplify the monitoring of player actions.

## How to import.
This is available as Swift package manager, on XCode menu **File** ->  **Swift Packages** -> **Add Package Dependency** and use this repo as reference [https://github.com/anderson-gusmao/ControlGameKit.git
](https://github.com/anderson-gusmao/ControlGameKit.git) or you can clone and build it locally as a framework. 

## How to use.
As simple as subsbribe to any Combine framework publisher, do not forget to **import ControlGameKit** into your class. 

```swift
private var joystick = Joystick()
private var cancellable: AnyCancellable?

func anyFunction() {
	cancellable = joystick.buttons.onActionA.sink(receiveValue: { action in
		switch action {
		case .pressed(let player, _):
			print("\(player)")
		case .released(let player)
			print("\(player)")
		}
	})
}
```

## What you will find in this project
###Buttons events

* *joystick.buttons.onActionA* - **Press** and **release** actions from **A** button from joystick user;
* *joystick.buttons.onActionB* - **Press** and **release** actions from **B** button from joystick user;
* *joystick.buttons.onActionX* - **Press** and **release** actions from **X** button from joystick user;
* *joystick.buttons.onActionY* - **Press** and **release** actions from **Y** button from joystick user;
* *joystick.buttons.onActionMenu* - **Press** and **release** actions from **Menu** button from joystick user;
* *joystick.buttons.onActionOption* - **Press** and **release** actions from **Options** button from joystick user;
* *joystick.buttons.onActionLeftShoulder* - **Press** and **release** actions from **Left Shoulder** button from joystick user;
* *joystick.buttons.onActionRightShoulder* - **Press** and **release** actions from **Right Shoulder** button from joystick user;
* *joystick.buttons.onActionLeftTrigger* - **Press** and **release** actions from **Left Trigger** button from joystick user; 
* *joystick.buttons.onActionRightTrigger* - **Press** and **release** actions from **Right Trigger** button from joystick user;

##### *The trigger buttons are special type that have analog behavior, therefore, they have an associated value to express how much were pressed by the player.*

###Dpad events

* *joystick.dpad.onChange* - **Up**, **Down**,**Left**, **Right**, **UpLeft**, **UpRight**,**downLeft**, **downRight** and **center** actions from game player.

###Thumbstick events

* *joystick.thumbstick.onMoveLeft* - **Up**, **Down**,**Left**, **Right**, **UpLeft**, **UpRight**,**downLeft**, **downRight** and **center** actions from game player in the **left** thumbstick.  
* *joystick.thumbstick.onMoveRight* - **Up**, **Down**,**Left**, **Right**, **UpLeft**, **UpRight**,**downLeft**, **downRight** and **center** actions from game player in the **right** thumbstick.  
* *joystick.thumbstick.onPressLeft* - **Press** and **release** actions from **Left Thumstick** button from joystick user;
* *joystick.thumbstick.onPressRight* - **Press** and **release** actions from **Right Thumstick** button from joystick user;

##### *The thumbstick controls are special type that have analog behavior, therefore, they have an associated value to express how much were pressed by the player.*

###Link events
* *joystick.link.onConnect* - It sends a message always when a new joystick is connected;
* *joystick.link.onDisconnect* - It sends a message always when any joystick is disconnected;


##Help to improve the project. 
If you think any feature is missing or if you would like to improve anything, you are welcome to join and help to improve the project, open a pull request and let's build it toghether. 