#pragma once

#include "TES3Object.h"

#include "NIObject.h"

namespace TES3 {
	struct Land : BaseObject {
		NI::Pointer<NI::Object> unknown_0x10;
		int unknown_0x14; // Data chunk. Masked with & 0xFFFFFC07
		int unknown_0x18;
		int unknown_0x1C;
		int unknown_0x20;
		int unknown_0x24;
		float unknown_0x28;
		int unknown_0x2C[128];
		NI::Pointer<NI::Object> unknown_0x22C;
		int gridX; // 0x230
		int gridY; // 0x234
		float unknown_0x238;
		float unknown_0x23C;
	};
	static_assert(sizeof(Land) == 0x240, "TES3::Land failed size validation");
}

MWSE_SOL_CUSTOMIZED_PUSHER_DECLARE_TES3(TES3::Land)
