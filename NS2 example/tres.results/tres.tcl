Set RandomNumberSeed = 0
Set SimSpeed = AS_FAST_AS_POSSIBLE
Set TickToNanoSec = 100
Set WireLogFlag = on
Set WirelessLogFlag = on
Set GPRSLogFlag = on
Set OphyLogFlag = on
Set WiMAXLogFlag = on
Set MobileWIMAXLogFlag = on
Set MobileRelayWIMAXLogFlag = on
Set MR_WIMAX_NT_LogFlag = on
Set WiMAXChannelCoding = Off
Set WiFiChannelCoding = Off
Set WAVEChannelCoding = Off
Set MobileWIMAXChannelCoding = Off
Set MobileRelayWIMAXChannelCoding = Off
Set MR_WIMAXChannelCoding_NT = Off
Set DVBChannelCoding = off
Set SatLogFlag = off
Set DynamicMovingPath = Off
Set OnlinePacketTransmission = Off
Set GdbStart = off


Create Node 1 as HOST with name = HOST1
	Define port 1
		Module Interface : Node1_Interface_LINK_1
			Set Node1_Interface_LINK_1.guitag_ordinary = yes
			Set Node1_Interface_LINK_1.ip = 1.0.1.1
			Set Node1_Interface_LINK_1.netmask = 255.255.255.0

		Module ARP : Node1_ARP_LINK_1
			Set Node1_ARP_LINK_1.guitag_ordinary = yes
			Set Node1_ARP_LINK_1.arpMode = RunARP
			Set Node1_ARP_LINK_1.flushInterval = 3000
			Set Node1_ARP_LINK_1.ArpTableFileName = tres.arp

		Module FIFO : Node1_FIFO_LINK_1
			Set Node1_FIFO_LINK_1.guitag_ordinary = yes
			Set Node1_FIFO_LINK_1.max_qlen = 50
			Set Node1_FIFO_LINK_1.log_qlen = off
			Set Node1_FIFO_LINK_1.log_option = FullLog
			Set Node1_FIFO_LINK_1.samplerate = 1
			Set Node1_FIFO_LINK_1.logFileName = tres.fifo_N1_P1_qlen.log

		Module MAC8023 : Node1_MAC8023_LINK_1
			Set Node1_MAC8023_LINK_1.guitag_ordinary = yes
			Set Node1_MAC8023_LINK_1.mac = 0:1:0:0:0:2
			Set Node1_MAC8023_LINK_1.PromisOpt = off
			Set Node1_MAC8023_LINK_1.mode = full
			Set Node1_MAC8023_LINK_1.log = off
			Set Node1_MAC8023_LINK_1.logInterval = 1
			Set Node1_MAC8023_LINK_1.NumCollision = off
			Set Node1_MAC8023_LINK_1.NumUniInPkt = off
			Set Node1_MAC8023_LINK_1.NumUniOutPkt = off
			Set Node1_MAC8023_LINK_1.NumUniInOutPkt = off
			Set Node1_MAC8023_LINK_1.NumBroInPkt = off
			Set Node1_MAC8023_LINK_1.NumBroOutPkt = off
			Set Node1_MAC8023_LINK_1.NumBroInOutPkt = off
			Set Node1_MAC8023_LINK_1.NumDrop = off
			Set Node1_MAC8023_LINK_1.InThrput = off
			Set Node1_MAC8023_LINK_1.OutThrput = off
			Set Node1_MAC8023_LINK_1.InOutThrput = off
			Set Node1_MAC8023_LINK_1.UniInLogFile = tres.8023_N1_P1_UniIn.log
			Set Node1_MAC8023_LINK_1.UniOutLogFile = tres.8023_N1_P1_UniOut.log
			Set Node1_MAC8023_LINK_1.UniInOutLogFile = tres.8023_N1_P1_UniInOut.log
			Set Node1_MAC8023_LINK_1.BroInLogFile = tres.8023_N1_P1_BroIn.log
			Set Node1_MAC8023_LINK_1.BroOutLogFile = tres.8023_N1_P1_BroOut.log
			Set Node1_MAC8023_LINK_1.BroInOutLogFile = tres.8023_N1_P1_BroInOut.log
			Set Node1_MAC8023_LINK_1.CollLogFile = tres.8023_N1_P1_Coll.log
			Set Node1_MAC8023_LINK_1.DropLogFile = tres.8023_N1_P1_Drop.log
			Set Node1_MAC8023_LINK_1.InThrputLogFile = tres.8023_N1_P1_InThrput.log
			Set Node1_MAC8023_LINK_1.OutThrputLogFile = tres.8023_N1_P1_OutThrput.log
			Set Node1_MAC8023_LINK_1.InOutThrputLogFile = tres.8023_N1_P1_InOutThrput.log

		Module TCPDUMP : Node1_TCPDUMP_LINK_1
			Set Node1_TCPDUMP_LINK_1.guitag_ordinary = yes

		Module Phy : Node1_Phy_LINK_1
			Set Node1_Phy_LINK_1.guitag_ordinary = yes
			Set Node1_Phy_LINK_1.Bw = 50.00
			Set Node1_Phy_LINK_1.BER = 0.000000000
			Set Node1_Phy_LINK_1.PropDelay = 1.00
			Set Node1_Phy_LINK_1.linkfail = off
			Set Node1_Phy_LINK_1.linkfailFileName = tres.phy_N1_P1.linkfail

		Module Link : Node1_LINK_1
			Set Node1_LINK_1.guitag_remotenode = yes


		Bind Node1_Interface_LINK_1 Node1_ARP_LINK_1
		Bind Node1_ARP_LINK_1 Node1_FIFO_LINK_1
		Bind Node1_FIFO_LINK_1 Node1_MAC8023_LINK_1
		Bind Node1_MAC8023_LINK_1 Node1_TCPDUMP_LINK_1
		Bind Node1_TCPDUMP_LINK_1 Node1_Phy_LINK_1
		Bind Node1_Phy_LINK_1 Node1_LINK_1
	EndDefine

EndCreate

Create Node 2 as MobileRelayWIMAX_PMPBS with name = MobileRelayWIMAX_PMPBS2
	Define port 1
		Module Interface : Node2_Interface_LINK_1
			Set Node2_Interface_LINK_1.guitag_ordinary = yes
			Set Node2_Interface_LINK_1.ip = 1.0.2.1
			Set Node2_Interface_LINK_1.netmask = 255.255.255.0

		Module MAC802_16J_PMPBS : Node2_MAC802_16J_PMPBS_LINK_1
			Set Node2_MAC802_16J_PMPBS_LINK_1.guitag_ordinary = yes
			Set Node2_MAC802_16J_PMPBS_LINK_1.macaddr = 0:1:0:0:0:4
			Set Node2_MAC802_16J_PMPBS_LINK_1.LinkMode = Auto
			Set Node2_MAC802_16J_PMPBS_LINK_1.BSCfgFile = tres.mobilerelaywimax_cfg
			Set Node2_MAC802_16J_PMPBS_LINK_1.CSTYPE = IPv4
			Set Node2_MAC802_16J_PMPBS_LINK_1.NBRBSCfgFile = tres.mr_nbrbs_list

		Module OFDMA_PMPBS_MR : Node2_OFDMA_PMPBS_MR_LINK_1
			Set Node2_OFDMA_PMPBS_MR_LINK_1.guitag_ordinary = yes
			Set Node2_OFDMA_PMPBS_MR_LINK_1.ChannelID = 2
			Set Node2_OFDMA_PMPBS_MR_LINK_1.freq = 2300
			Set Node2_OFDMA_PMPBS_MR_LINK_1.TransPower = 40
			Set Node2_OFDMA_PMPBS_MR_LINK_1.CSThresh = -99

		Module CM : Node2_CM_LINK_1
			Set Node2_CM_LINK_1.guitag_ordinary = yes
			Set Node2_CM_LINK_1.FadingVar = 10.0
			Set Node2_CM_LINK_1.RiceanK = 10.0
			Set Node2_CM_LINK_1.avgHB = 10.0
			Set Node2_CM_LINK_1.avgDist = 80.0
			Set Node2_CM_LINK_1.StreetWidth = 30.0
			Set Node2_CM_LINK_1.PLExp = 2.0
			Set Node2_CM_LINK_1.std_db = 4.0
			Set Node2_CM_LINK_1.dist0 = 1.0
			Set Node2_CM_LINK_1.SystemLoss = 1.0
			Set Node2_CM_LINK_1.antennaHeight = 40
			Set Node2_CM_LINK_1.propChannelMode = empirical
			Set Node2_CM_LINK_1.PLModel = Two_Ray_Ground
			Set Node2_CM_LINK_1.fadingModel = None
			Set Node2_CM_LINK_1.empiricalModel = COST_231_Hata
			Set Node2_CM_LINK_1.AGPOpt = 1
			Set Node2_CM_LINK_1.AGPFileName = /usr/local/nctuns/etc/agp/80216e_pmp_bs.agp

		Module Link : Node2_LINK_1
			Set Node2_LINK_1.guitag_remotenode = yes


		Bind Node2_Interface_LINK_1 Node2_MAC802_16J_PMPBS_LINK_1
		Bind Node2_MAC802_16J_PMPBS_LINK_1 Node2_OFDMA_PMPBS_MR_LINK_1
		Bind Node2_OFDMA_PMPBS_MR_LINK_1 Node2_CM_LINK_1
		Bind Node2_CM_LINK_1 Node2_LINK_1
	EndDefine

	Define port 2
		Module Interface : Node2_Interface_LINK_2
			Set Node2_Interface_LINK_2.guitag_ordinary = yes
			Set Node2_Interface_LINK_2.ip = 1.0.1.2
			Set Node2_Interface_LINK_2.netmask = 255.255.255.0

		Module ARP : Node2_ARP_LINK_2
			Set Node2_ARP_LINK_2.guitag_ordinary = yes
			Set Node2_ARP_LINK_2.arpMode = RunARP
			Set Node2_ARP_LINK_2.flushInterval = 3000
			Set Node2_ARP_LINK_2.ArpTableFileName = tres.arp

		Module FIFO : Node2_FIFO_LINK_2
			Set Node2_FIFO_LINK_2.guitag_ordinary = yes
			Set Node2_FIFO_LINK_2.max_qlen = 50
			Set Node2_FIFO_LINK_2.log_qlen = off
			Set Node2_FIFO_LINK_2.log_option = FullLog
			Set Node2_FIFO_LINK_2.samplerate = 1
			Set Node2_FIFO_LINK_2.logFileName = tres.fifo_N2_P2_qlen.log

		Module MAC8023 : Node2_MAC8023_LINK_2
			Set Node2_MAC8023_LINK_2.guitag_ordinary = yes
			Set Node2_MAC8023_LINK_2.mac = 0:1:0:0:0:3
			Set Node2_MAC8023_LINK_2.PromisOpt = off
			Set Node2_MAC8023_LINK_2.mode = full
			Set Node2_MAC8023_LINK_2.log = off
			Set Node2_MAC8023_LINK_2.logInterval = 1
			Set Node2_MAC8023_LINK_2.NumCollision = off
			Set Node2_MAC8023_LINK_2.NumUniInPkt = off
			Set Node2_MAC8023_LINK_2.NumUniOutPkt = off
			Set Node2_MAC8023_LINK_2.NumUniInOutPkt = off
			Set Node2_MAC8023_LINK_2.NumBroInPkt = off
			Set Node2_MAC8023_LINK_2.NumBroOutPkt = off
			Set Node2_MAC8023_LINK_2.NumBroInOutPkt = off
			Set Node2_MAC8023_LINK_2.NumDrop = off
			Set Node2_MAC8023_LINK_2.InThrput = off
			Set Node2_MAC8023_LINK_2.OutThrput = off
			Set Node2_MAC8023_LINK_2.InOutThrput = off
			Set Node2_MAC8023_LINK_2.UniInLogFile = tres.8023_N2_P2_UniIn.log
			Set Node2_MAC8023_LINK_2.UniOutLogFile = tres.8023_N2_P2_UniOut.log
			Set Node2_MAC8023_LINK_2.UniInOutLogFile = tres.8023_N2_P2_UniInOut.log
			Set Node2_MAC8023_LINK_2.BroInLogFile = tres.8023_N2_P2_BroIn.log
			Set Node2_MAC8023_LINK_2.BroOutLogFile = tres.8023_N2_P2_BroOut.log
			Set Node2_MAC8023_LINK_2.BroInOutLogFile = tres.8023_N2_P2_BroInOut.log
			Set Node2_MAC8023_LINK_2.CollLogFile = tres.8023_N2_P2_Coll.log
			Set Node2_MAC8023_LINK_2.DropLogFile = tres.8023_N2_P2_Drop.log
			Set Node2_MAC8023_LINK_2.InThrputLogFile = tres.8023_N2_P2_InThrput.log
			Set Node2_MAC8023_LINK_2.OutThrputLogFile = tres.8023_N2_P2_OutThrput.log
			Set Node2_MAC8023_LINK_2.InOutThrputLogFile = tres.8023_N2_P2_InOutThrput.log

		Module Phy : Node2_Phy_LINK_2
			Set Node2_Phy_LINK_2.guitag_ordinary = yes
			Set Node2_Phy_LINK_2.Bw = 50.00
			Set Node2_Phy_LINK_2.BER = 0.000000000
			Set Node2_Phy_LINK_2.PropDelay = 1.00
			Set Node2_Phy_LINK_2.linkfail = off
			Set Node2_Phy_LINK_2.linkfailFileName = tres.phy_N2_P2.linkfail

		Module Link : Node2_LINK_2
			Set Node2_LINK_2.guitag_remotenode = yes


		Bind Node2_Interface_LINK_2 Node2_ARP_LINK_2
		Bind Node2_ARP_LINK_2 Node2_FIFO_LINK_2
		Bind Node2_FIFO_LINK_2 Node2_MAC8023_LINK_2
		Bind Node2_MAC8023_LINK_2 Node2_Phy_LINK_2
		Bind Node2_Phy_LINK_2 Node2_LINK_2
	EndDefine

EndCreate

Create Node 3 as MobileRelayWIMAX_PMPRS with name = MobileRelayWIMAX_PMPRS3
	Define port 1
		Module Interface : Node3_Interface_LINK_1
			Set Node3_Interface_LINK_1.guitag_ordinary = yes
			Set Node3_Interface_LINK_1.ip = 1.0.2.2
			Set Node3_Interface_LINK_1.netmask = 255.255.255.0

		Module MAC802_16J_PMPRS : Node3_MAC802_16J_PMPRS_LINK_1
			Set Node3_MAC802_16J_PMPRS_LINK_1.guitag_ordinary = yes
			Set Node3_MAC802_16J_PMPRS_LINK_1.macaddr = 0:1:0:0:0:5
			Set Node3_MAC802_16J_PMPRS_LINK_1.LinkMode = Auto
			Set Node3_MAC802_16J_PMPRS_LINK_1.CSTYPE = IPv4

		Module OFDMA_PMPRS_MR : Node3_OFDMA_PMPRS_MR_LINK_1
			Set Node3_OFDMA_PMPRS_MR_LINK_1.guitag_ordinary = yes
			Set Node3_OFDMA_PMPRS_MR_LINK_1.ChannelID = 2
			Set Node3_OFDMA_PMPRS_MR_LINK_1.freq = 2300
			Set Node3_OFDMA_PMPRS_MR_LINK_1.TransPower = 30
			Set Node3_OFDMA_PMPRS_MR_LINK_1.CSThresh = -96

		Module CM : Node3_CM_LINK_1
			Set Node3_CM_LINK_1.guitag_ordinary = yes
			Set Node3_CM_LINK_1.FadingVar = 10.0
			Set Node3_CM_LINK_1.RiceanK = 10.0
			Set Node3_CM_LINK_1.avgHB = 10.0
			Set Node3_CM_LINK_1.avgDist = 80.0
			Set Node3_CM_LINK_1.StreetWidth = 30.0
			Set Node3_CM_LINK_1.PLExp = 2.0
			Set Node3_CM_LINK_1.std_db = 4.0
			Set Node3_CM_LINK_1.dist0 = 1.0
			Set Node3_CM_LINK_1.SystemLoss = 1.0
			Set Node3_CM_LINK_1.antennaHeight = 30
			Set Node3_CM_LINK_1.propChannelMode = empirical
			Set Node3_CM_LINK_1.PLModel = Two_Ray_Ground
			Set Node3_CM_LINK_1.fadingModel = None
			Set Node3_CM_LINK_1.empiricalModel = COST_231_Hata
			Set Node3_CM_LINK_1.AGPOpt = 1
			Set Node3_CM_LINK_1.AGPFileName = /usr/local/nctuns/etc/agp/80216e_pmp_bs.agp

		Module Link : Node3_LINK_1
			Set Node3_LINK_1.guitag_remotenode = yes


		Bind Node3_Interface_LINK_1 Node3_MAC802_16J_PMPRS_LINK_1
		Bind Node3_MAC802_16J_PMPRS_LINK_1 Node3_OFDMA_PMPRS_MR_LINK_1
		Bind Node3_OFDMA_PMPRS_MR_LINK_1 Node3_CM_LINK_1
		Bind Node3_CM_LINK_1 Node3_LINK_1
	EndDefine

EndCreate

Create Node 4 as MobileRelayWIMAX_PMPMS with name = MobileRelayWIMAX_PMPMS4
	Define port 1
		Module Interface : Node4_Interface_LINK_1
			Set Node4_Interface_LINK_1.guitag_ordinary = yes
			Set Node4_Interface_LINK_1.ip = 1.0.2.3
			Set Node4_Interface_LINK_1.netmask = 255.255.255.0

		Module MAC802_16J_PMPMS : Node4_MAC802_16J_PMPMS_LINK_1
			Set Node4_MAC802_16J_PMPMS_LINK_1.guitag_ordinary = yes
			Set Node4_MAC802_16J_PMPMS_LINK_1.macaddr = 0:1:0:0:0:6
			Set Node4_MAC802_16J_PMPMS_LINK_1.LinkMode = Auto

		Module OFDMA_PMPMS_MR : Node4_OFDMA_PMPMS_MR_LINK_1
			Set Node4_OFDMA_PMPMS_MR_LINK_1.guitag_ordinary = yes
			Set Node4_OFDMA_PMPMS_MR_LINK_1.ChannelID = 2
			Set Node4_OFDMA_PMPMS_MR_LINK_1.freq = 2300
			Set Node4_OFDMA_PMPMS_MR_LINK_1.TransPower = 35
			Set Node4_OFDMA_PMPMS_MR_LINK_1.CSThresh = -96

		Module CM : Node4_CM_LINK_1
			Set Node4_CM_LINK_1.guitag_ordinary = yes
			Set Node4_CM_LINK_1.FadingVar = 10.0
			Set Node4_CM_LINK_1.RiceanK = 10.0
			Set Node4_CM_LINK_1.avgHB = 10.0
			Set Node4_CM_LINK_1.avgDist = 80.0
			Set Node4_CM_LINK_1.StreetWidth = 30.0
			Set Node4_CM_LINK_1.PLExp = 2.0
			Set Node4_CM_LINK_1.std_db = 4.0
			Set Node4_CM_LINK_1.dist0 = 1.0
			Set Node4_CM_LINK_1.SystemLoss = 1.0
			Set Node4_CM_LINK_1.antennaHeight = 2
			Set Node4_CM_LINK_1.propChannelMode = empirical
			Set Node4_CM_LINK_1.PLModel = Two_Ray_Ground
			Set Node4_CM_LINK_1.fadingModel = None
			Set Node4_CM_LINK_1.empiricalModel = COST_231_Hata
			Set Node4_CM_LINK_1.AGPOpt = 1
			Set Node4_CM_LINK_1.AGPFileName = /usr/local/nctuns/etc/agp/80216e_pmp_ms.agp

		Module Link : Node4_LINK_1
			Set Node4_LINK_1.guitag_remotenode = yes


		Bind Node4_Interface_LINK_1 Node4_MAC802_16J_PMPMS_LINK_1
		Bind Node4_MAC802_16J_PMPMS_LINK_1 Node4_OFDMA_PMPMS_MR_LINK_1
		Bind Node4_OFDMA_PMPMS_MR_LINK_1 Node4_CM_LINK_1
		Bind Node4_CM_LINK_1 Node4_LINK_1
	EndDefine

EndCreate

Connect WIRE 1.Node1_LINK_1 2.Node2_LINK_2

Connect MobileRelayWIMAX 2.Node2_LINK_1 3.Node3_LINK_1 4.Node4_LINK_1 


Run 200
