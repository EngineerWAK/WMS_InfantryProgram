private ["_object","_UID"];
params[
	"_target" //netID
];
_object = objectFromNetId _target;
_UID = _object getVariable ["ExileOwnerUID", ""];
diag_log format ["[UID REQUEST]|WAK|TNA|WAK| _target:%1 _object:%2 _UID:%3 ", _target, _object, _UID];
if (_object isKindOf "UK3CB_BAF_Merlin_HM2_18" ) then {
	_object setVariable ["ExileOwnerUID", _UID, true];
};
_UID