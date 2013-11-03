/*
 *	This file is part of IVNet-Gamemode (OSG).
 *
 *  IVNet-Gamemode (OSG) is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.

 *  IVNet-Gamemode (OSG) is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.

 *  You should have received a copy of the GNU General Public License
 *  along with IVNet-Gamemode (OSG).  If not, see <http://www.gnu.org/licenses/>.
 *
 *
 *  @file: PlayerEvents.nut
 *	@desc: Contains the handlers for player events
 *	@init-author: Jan Christophersen
 *	@date: 03.11.2013
 */

/*
 *	function onPlayerJoin (enPlayer)
 *
 *	Description:
 *		This handler gets called when a new player joins the server.
 *		We will make everything ready for the player here.
 *
 *	Parameter(s):
 *		<instance>	enPlayer	-	the player entity 
 *
 *	Return:
 *		void
 */
function onPlayerJoin (enPlayer)
{
	debug(enPlayer.getName() + " joined the server. ID: " + enPlayer.getId());

	// Add the player to the manager
	g_PlayerManager.Add(enPlayer);

	g_PlayerManager.Broadcast(enPlayer.getName() + " joined.");
}

/*
 *	function onPlayerRequestSpawn (enPlayer)
 *
 *	Description:
 *		Will be called upon spawn request of player (when he finished loading everything)
 *
 *	Parameter(s):
 *		<instance>	enPlayer	-	the player entity 
 *
 *	Return:
 *		void
 */
function onPlayerRequestSpawn (enPlayer)
{
	enPlayer.sendMessage("Hey, " + enPlayer.getName() + ". Your current level is " + enPlayer.m_iLevel + ".");
    enPlayer.spawn(166.187,367.387,15.179,90.0);
}

// Register all handlers
addEvent("playerJoin", onPlayerJoin);
addEvent("onPlayerRequestSpawn", onPlayerRequestSpawn);