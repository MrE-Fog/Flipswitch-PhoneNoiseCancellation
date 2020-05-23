#import <Flipswitch/FSSwitchDataSource.h>
#import <Flipswitch/FSSwitchPanel.h>

@interface PhoneNoiseCancellationSwitch : NSObject <FSSwitchDataSource>
@end

extern "C" BOOL _AXSEarpieceNoiseCancellationEnabled();
extern "C" void _AXSEarpieceNoiseCancellationSetEnabled(BOOL);

@implementation PhoneNoiseCancellationSwitch

- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier
{
	return _AXSEarpieceNoiseCancellationEnabled() ? FSSwitchStateOn : FSSwitchStateOff;
}

- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier
{
	if (newState == FSSwitchStateIndeterminate)
		return;
	_AXSEarpieceNoiseCancellationSetEnabled(newState == FSSwitchStateOn);
}

@end
