import Toybox.Lang;
import Toybox.WatchUi;

class MonkeyToDoDelegate extends WatchUi.BehaviorDelegate {

    public var index = 1;

    function initialize() {
        BehaviorDelegate.initialize();
    }

     function onKey(keyEvent) {
        System.println(keyEvent.getKey());         // e.g. KEY_MENU = 7
        return true;
    }

    function onTap(clickEvent) {
        System.println(clickEvent.getType());      // e.g. CLICK_TYPE_TAP = 0
        return true;
    }

    function onSwipe(swipeEvent) {
        System.println(swipeEvent.getDirection()); // e.g. SWIPE_DOWN = 2
       
        if(swipeEvent.getDirection() == SWIPE_DOWN) {
            goToNextTask();
        }
        return true;
    }

    function goToNextTask(){
        var view = new MonkeyToDoView();
        var delegate = new MonkeyToDoDelegate();
        view.Text = "Task " + index;
        delegate.index = index + 1;
        WatchUi.pushView(view, delegate, WatchUi.SLIDE_DOWN);
    }

    function onMenu() as Boolean {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new MonkeyToDoMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

}