import com.GameInterface.Game.Character;
import com.GameInterface.Game.TargetingInterface;
import com.GameInterface.Input;
import com.Utils.ID32;
class com.fox.TargetOfTarget {
	static var m_Player:Character;
	
	public static function main(swfRoot:MovieClip):Void {
		var s_app = new TargetOfTarget(swfRoot);
		m_Player = Character.GetClientCharacter()
	}
	public function TargetOfTarget() {
		Input.RegisterHotkey(_global.Enums.InputCommand.e_InputCommand_AssistOffensive, "com.fox.TargetOfTarget.HotKeyPressed", _global.Enums.Hotkey.eHotkeyDown, 0);
	}
	public static function HotKeyPressed() {
		var EnemyID:ID32 = m_Player.GetOffensiveTarget();
		var Enemy:Character = new Character(EnemyID);
		var TargetsTarget:ID32 = Enemy.GetOffensiveTarget();
		if(TargetsTarget) TargetingInterface.SetTarget(TargetsTarget);
	}
}