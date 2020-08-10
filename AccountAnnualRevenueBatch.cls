global class AccountAnnualRevenueBatch implements Database.Batchable<SObject> {
	global AccountAnnualRevenueBatch() {
		
	}
	
	/**
	 * @description gets invoked when the batch job starts
	 * @param context contains the job ID
	 * @returns the record set as a QueryLocator object that will be batched for execution
	 */ 
	global Database.QueryLocator start(Database.BatchableContext context) {
		return Database.getQueryLocator('SELECT Id, HCSS_Revenue__c FROM Account where inactive__c = false and type = \'Customer\'');
	}

	/**
	 * @description gets invoked when the batch job executes and operates on one batch of records. Contains or calls the main execution logic for the batch job.
	 * @param context contains the job ID
	 * @param scope contains the batch of records to process.
	 */ 
   	global void execute(Database.BatchableContext context, List<Account> scope) {
		// Get a set of account ids for soql of invoice headers
		set<Id> acctIds = new Set<Id>();
		For(Account acct : scope){
			acctIds.add(acct.id);
		}

		// Create a list of SaaS products
		List<String> rrProductList = new List<String>();
		rrProductList.add('MAINT-DIS');
		rrProductList.add('MAINT-DISP');
		rrProductList.add('MAINT-EM');
		rrProductList.add('MAINT-FP');
		rrProductList.add('MAINT-HB');
		rrProductList.add('MAINT-HJ');
		rrProductList.add('MAINT-SAF');
		rrProductList.add('MAP-MAINT');
		rrProductList.add('OTH-MAINTD');
		rrProductList.add('EQP-E360');
		rrProductList.add('EQP-SUB');
		rrProductList.add('FLDAPP');
		rrProductList.add('GR-HJFMSAF');
		rrProductList.add('GR-HJMMSAF');
		rrProductList.add('HJ-MGRMOB');
		rrProductList.add('HJ-MGRSAAS');
		rrProductList.add('HJM-SUB');
		rrProductList.add('HJ-SLO');
		rrProductList.add('OTH-HJMOB');
		rrProductList.add('OTHHJMOBN');
		rrProductList.add('SAF-BASSUB');
		rrProductList.add('SAFE-FLD2');
		rrProductList.add('SAFE-MSTR');
		rrProductList.add('SAFETY-FLD');
		rrProductList.add('SAFETYGRP');
		rrProductList.add('SAFETY-HUB');
		rrProductList.add('SAFETY-MGR');
		rrProductList.add('SAF-FLD');
		rrProductList.add('SAF-GMM');
		rrProductList.add('SAF-HJBDL');
		rrProductList.add('SAF-INSP');
		rrProductList.add('SAFMACTFEE');
		rrProductList.add('SAF-MOBF');
		rrProductList.add('SAF-MOBFHJ');
		rrProductList.add('SAF-MOBMGR');
		rrProductList.add('SAF-PROR');
		rrProductList.add('SAF-PROSUB');
		rrProductList.add('SAF-SAAS1');
		rrProductList.add('SAF-SAAS2');
		rrProductList.add('SAF-SKILL');
		rrProductList.add('SAF-SKILLC');
		rrProductList.add('BKUP-SERV');
		rrProductList.add('BKUP-STRG');
		rrProductList.add('CLD-1APPY');
		rrProductList.add('CLD-2APPY');
		rrProductList.add('CLD-360M');
		rrProductList.add('CLD-3RAPP2');
		rrProductList.add('CLD-3RAPP3');
		rrProductList.add('CLD-3RDAPP');
		rrProductList.add('CLD-AU');
		rrProductList.add('CLD-BASE');
		rrProductList.add('CLDCFG1115');
		rrProductList.add('CLDCFG6-10');
		rrProductList.add('CLDCNFG-1');
		rrProductList.add('CLDCNFG3-5');
		rrProductList.add('CLD-CONFIG');
		rrProductList.add('CLD-DG2-10');
		rrProductList.add('CLD-DISP');
		rrProductList.add('CLDDM11-20');
		rrProductList.add('CLD-DMGR');
		rrProductList.add('CLD-E360');
		rrProductList.add('CLD-FEE');
		rrProductList.add('CLD-HB');
		rrProductList.add('CLD-HJ');
		rrProductList.add('CLD-INFR');
		rrProductList.add('CLD-JD');
		rrProductList.add('CLD-PSU');
		rrProductList.add('CLD-PSUP');
		rrProductList.add('CLD-R360M');
		rrProductList.add('CLD-3RAP3');
		rrProductList.add('CLD-R3RDAP');
		rrProductList.add('CLD-RBASE');
		rrProductList.add('CLD-RDISP');
		rrProductList.add('CLD-RDMGR');
		rrProductList.add('CLD-RE360');
		rrProductList.add('CLD-RHB');
		rrProductList.add('CLD-RHJ');
		rrProductList.add('CLD-RINFR');
		rrProductList.add('CLD-RPRO');
		rrProductList.add('CLD-RSQLSR');
		rrProductList.add('CLD-RVMENT');
		rrProductList.add('CLD-RVMPRO');
		rrProductList.add('CLD-SPRO');
		rrProductList.add('CLD-SQLAF');
		rrProductList.add('CLD-SQLSVR');
		rrProductList.add('CLDSSUP');
		rrProductList.add('CLD-STOR');
		rrProductList.add('CLD-SVCF');
		rrProductList.add('CLD-SWAP');
		rrProductList.add('CLD-UBYOL');
		rrProductList.add('CLD-UBYOLR');
		rrProductList.add('CLD-URSCN');
		rrProductList.add('CLD-USBYOL');
		rrProductList.add('CLD-USER');
		rrProductList.add('CLD-VMENT');
		rrProductList.add('CLD-VMPRO');
		rrProductList.add('CLOUD-LIC');
		rrProductList.add('CLOUD-MNT');
		rrProductList.add('GPS-15MO');
		rrProductList.add('GPS-1HR');
		rrProductList.add('GPS-2MIN');
		rrProductList.add('GPS2MINCAM');
		rrProductList.add('GPS2MINCAY');
		rrProductList.add('GPS-2MINMO');
		rrProductList.add('GPS-4HR');
		rrProductList.add('GPS-4HRCAM');
		rrProductList.add('GPS-4HRCAY');
		rrProductList.add('GPS-4HRM');
		rrProductList.add('GPS4HRSAM');
		rrProductList.add('GPS4HRSAY');
		rrProductList.add('GPS-4MGARM');
		rrProductList.add('GPS4MINSAM');
		rrProductList.add('GPS-SERMY');
		rrProductList.add('GPS-SERV');
		rrProductList.add('GPS-SERV1H');
		rrProductList.add('GPS-SERV1M');
		rrProductList.add('GPS-SERV2M');
		rrProductList.add('GPS-SERVCA');
		rrProductList.add('GPS-SERVMO');
		rrProductList.add('GPS-SERVTD');
		rrProductList.add('GPS-SRV15M');
		rrProductList.add('GPS-SRVTDM');

		// Query for revenue totals
//		datetime fromDateTime = Datetime.newInstance(((Datetime.now()).addYears(-1)).year(), 1, 1, 0, 0, 0);
		date todayDate = Date.today().addYears(-1);
		datetime fromDateTime = Datetime.newInstance(todayDate.year(), todayDate.month(), todayDate.day(), 0, 0, 0);
		fromDateTime = fromDateTime.addDays(1);
		fromDateTime = fromDateTime.addHours(-5);
		
/*
		Map<Id, Decimal> accountRecRevSaaS = new Map<Id, Decimal>();

		id tempAcctId;
		decimal revenue = 0;
		List<AggregateResult> groupedResults = [SELECT header__r.account__c, sum(extension__C) FROM HOSS_Invoice_Line__c where Header__r.account__c in :acctIds and Header__r.Date_Posted__c >= :fromDateTime and product__c in :rrProductList group by header__r.account__c];
//		For(List<AggregateResult> groupedResults : [SELECT header__r.account__c, sum(extension__C) FROM HOSS_Invoice_Line__c where Header__r.account__c in :acctIds and Header__r.Date_Posted__c >= :fromDateTime and product__c in :rrProductList group by header__r.account__c]){
//System.debug('groupedResults count = ' + groupedResults.size());	
		For (AggregateResult ar: groupedResults){
			tempAcctId = (id)ar.get('account__c');
			revenue = (Decimal)ar.get('expr0');
			accountRecRevSaaS.put(tempAcctId, revenue);
		}
//		}
*/
		id prevId;
		decimal totalRevenue = 0;
		Map<Id, Decimal> acctRevenueMap = new Map<Id, Decimal>();
		For(List<HOSS_Invoice_Line__c> lineItemList : [SELECT Id, header__r.account__c, Product__c, extension__C FROM HOSS_Invoice_Line__c where Header__r.account__c in :acctIds and Header__r.Date_Posted__c >= :fromDateTime and product__c in :rrProductList order by header__r.account__c]){
			For (HOSS_Invoice_Line__c li: lineItemList){
				if (li.header__r.account__c != prevId){
					if (prevId != null) acctRevenueMap.put(prevId, totalRevenue);
					prevId = li.Header__r.account__c;
					totalRevenue = 0;
				}
				totalRevenue += li.Extension__c;
			}
		}
		if (prevId != null) acctRevenueMap.put(prevId, totalRevenue);

		decimal revenue = 0;
		for(account a : scope){
//			revenue = accountRecRevSaaS.get(a.id);
			revenue = acctRevenueMap.get(a.id);
			if (revenue == null) a.HCSS_Revenue__c = 0;
			else a.HCSS_Revenue__c = revenue;
		}
		update scope;
	}
/*	
   	global void execute(Database.BatchableContext context, List<Account> scope) {
		// Get a set of account ids for soql of invoice headers
		set<Id> acctIds = new Set<Id>();
		For(Account acct : scope){
			acctIds.add(acct.id);
		}
		// Query for revenue totals
		datetime fromDateTime = Datetime.newInstance(((Datetime.now()).addYears(-1)).year(), 1, 1, 0, 0, 0);
		datetime toDateTime = fromDateTime.addYears(1);
		id prevId;
		decimal totalRevenue = 0;
		Map<Id, Decimal> acctRevenueMap = new Map<Id, Decimal>();
		For(List<HOSS_Invoice_Header__c> invHdrList : [SELECT account__c, Total__c FROM HOSS_Invoice_Header__c where Date_Posted__c >= :fromDateTime and Date_Posted__c < :toDateTime and account__c in :acctIds order by account__c]){
			for(HOSS_Invoice_Header__c invHdr : invHdrList){
				if (invHdr.Account__c != prevId){
					if (prevId != null) acctRevenueMap.put(prevId, totalRevenue);
					prevId = invHdr.Account__c;
					totalRevenue = 0;
				}
				totalRevenue += invHdr.Total__c;
			}
		}
		if (prevId != null) acctRevenueMap.put(prevId, totalRevenue);

		// Update the Accounts with the annual revenue value
		decimal revenue = 0;
		for(account a : scope){
			revenue = acctRevenueMap.get(a.id);
			if (revenue == null) a.HCSS_Revenue__c = 0;
			else a.HCSS_Revenue__c = revenue;
		}
		update scope;
	}
*/
	/**
	 * @description gets invoked when the batch job finishes. Place any clean up code in this method.
	 * @param context contains the job ID
	 */ 
	global void finish(Database.BatchableContext context) {
/*
		OrgWideEmailAddress[] owea = [SELECT ID FROM OrgWideEmailAddress where Address = 'no-reply@hcss.com'];
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
		if (owea.size() > 0) {
			email.setOrgWideEmailAddressId(owea.get(0).id);
		}

        string [] toaddress= New string[]{'darrell.burditt@hcss.com'};
        email.setSubject ('Annual Account Revenue - Scheduled apex has completed');
        
		string emailbody = 'This email was sent to inform you that the batch process called AccountAnnualRevenueBatch.cls has run to completion.  This process calculates the total revenue for each Account from the previous year.  No action is required by you.';
		datetime fromDateTime = Datetime.newInstance(((Datetime.now()).addYears(-1)).year(), 1, 1, 0, 0, 0);
		datetime toDateTime = fromDateTime.addYears(1);
		email.setHtmlBody(emailBody);

        email.setToAddresses(toaddress);
        
        Messaging.sendEmail(New Messaging.SingleEmailMessage[]{email});
*/		
	}
}