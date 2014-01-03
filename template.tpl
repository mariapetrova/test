<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="{$css|urlsafe}" media="all">
<!--<title>{$preference.pref_inv_wording|htmlsafe} {$LANG.number_short}: {$invoice.index_id|htmlsafe}</title>-->
</head>
<body>
<br />
<div id="container">
	<div id="header">
	</div>

	<table width="100%">
		<tr>
			<th colspan="5" align="left"><span class="font1">{$preference.pref_inv_heading|htmlsafe}</span><br />ОРИГИНАЛ</th>
            <td><img src="{$logo|urlsafe}" border="0" hspace="0" align="right"></td>
		</tr>
		<tr>
			<td colspan="6">&nbsp;</td>
		</tr>
	</table>
    <hr />
	
	<table align="left" class="tbl1" width="500px" >
        <tr><th colspan="2" align="center" >{$LANG.customer}</th></tr>
        <tr >
			    <td border-right=1>Име:</td>
			    <td border-right=1>{$customer.name|htmlsafe}</td>
	    </tr>
        <tr >
                <td border-right=1>{$customFieldLabels.customer_cf2}:</td>
			    <td align="left" border-right=1 >{$customer.custom_field2|htmlsafe}</td>
        </tr>
         <tr >
                <td class=''>{$customFieldLabels.customer_cf1}:</td>
			    <td align="left" class='' >{$customer.custom_field1|htmlsafe}</td>
        </tr>
        <tr >
                <td class=''>Град:</td>
			    <td align="left" class='' >{$customer.city|htmlsafe}</td>
        </tr>

            {if $customer.street_address != null }
        <tr border-right="1">
                <td class=''>{$LANG.address}:</td>
			    <td class='' align="left" >{$customer.street_address|htmlsafe}</td>
        </tr>   
            {/if}
            {if $customer.street_address2 != null}
                    {if $customer.street_address == null}
        <tr>
                <td class=''>{$LANG.address}:</td>
			    <td class='' align="left" >{$customer.street_address2|htmlsafe}</td>
        </tr>   
                    {/if}
            {/if}
		
		 <tr>
                <td class=''>{$customFieldLabels.customer_cf4}:</td>
			    <td align="left" class=''  >{$customer.custom_field4|htmlsafe}</td>
        </tr>
		
	</table>
       
    <table  align="left" width="100px">
         <tr><td class="">{$LANG.number_short}:</td></tr>
       <!-- str_pad: Added by Misho -->
       <tr>
				<td class="" align="center" >{$invoice.index_id|str_pad:10:'0':$smarty.const.STR_PAD_LEFT}
                </td> 
       </tr>
       <tr><td class="">{$LANG.date}:</td></tr>
       <tr>
				<td class="" align="center" >{$invoice.date}</td>
		</tr>
    </table>

    <table align="right" class="tbl1" width="500px">
      <tr><th colspan="2" align="center" >{$LANG.biller}</th></tr>
        <tr>
			    <td  >Име:</td>
			    <td >{$biller.name|htmlsafe}</td>
	    </tr>
        <tr>
                <td class=''>{$customFieldLabels.biller_cf2}:</td>
			    <td align="left" class=''  >{$biller.custom_field2|htmlsafe}</td>
        </tr>
         <tr>
                <td class=''>{$customFieldLabels.biller_cf1}:</td>
			    <td align="left" class=''  >{$biller.custom_field1|htmlsafe}</td>
        </tr>
        <tr>
                <td class=''>Град:</td>
			    <td align="left" class='' >{$biller.city|htmlsafe}</td>
        </tr>

            {if $biller.street_address != null }
        <tr >
                <td class=''>{$LANG.address}:</td>
			    <td class='' align="left" >{$biller.street_address|htmlsafe}</td>
        </tr>   
            {/if}
            {if $biller.street_address2 != null}
                    {if $biller.street_address == null}
        <tr>
                <td class=''>{$LANG.address}:</td>
			    <td class='' align="left" >{$biller.street_address2|htmlsafe}</td>
        </tr>   
                    {/if}
            {/if}
		
		 <tr>
                <td class=''>{$customFieldLabels.biller_cf4}:</td>
			    <td align="left" class=''  >{$biller.custom_field4|htmlsafe}</td>
        </tr>

        </table>
	

	
	<table class="left" width="100%">
		<tr>
			<td colspan="6"><br /></td>
		</tr>

	{if $invoice.type_id == 2 }
			<tr>
				<td class="tbl1-bottom col1"><b>№</b></td> <!-- Added by Misho, reoridered -->
				<td class="tbl1-bottom col1" colspan="2"><b>{$LANG.item}</b></td>
				<td class="tbl1-bottom col1"><b>{$LANG.quantity_short}</b></td>
				<td class="tbl1-bottom col1"><b>МЯРКА</b></td>
				<td class="tbl1-bottom col1" align="right"><b>{$LANG.Unit_Cost}</b></td>
				<td class="tbl1-bottom col1" align="right"><b>{$LANG.Price}</b></td>
			</tr>
			
				{foreach from=$invoiceItems item=invoiceItem name=inv_item} <!-- name=inv_item: Added by Misho -->

			<tr class="" >
				<td class="">{$smarty.foreach.inv_item.iteration}</td> <!-- Added by Misho -->
				<td class="" colspan="2">{$invoiceItem.product.description|htmlsafe}</td>
				<td class="">{$invoiceItem.quantity|siLocal_number_trim}</td>
				<td class="">{$invoiceItem.product.custom_field1}</td>
				<td class="" align="right">{$invoiceItem.unit_price|siLocal_number}&nbsp;{$preference.pref_currency_sign|htmlsafe}</td><!-- sign: Misho-->
				<td class="" align="right">{$invoiceItem.gross_total|siLocal_number}&nbsp;{$preference.pref_currency_sign|htmlsafe}</td><!-- sign: Misho-->

			</tr>
			
             	{/foreach}
	{/if}

	{if $invoice.type_id == 3 }
			<tr class="tbl1-bottom col1">
				<td class="tbl1-bottom "><b>{$LANG.quantity_short}</b></td>
				<td colspan="3" class=" tbl1-bottom"><b>{$LANG.item}</b></td>
				<td align="right" class=" tbl1-bottom"><b>{$LANG.Unit_Cost}</b></td>
				<td align="right" class=" tbl1-bottom  "><b>{$LANG.Price}</b></td>
			</tr>
		
			{foreach from=$invoiceItems item=invoiceItem}
	
			<tr class=" ">
				<td class="" >{$invoiceItem.quantity|siLocal_number}</td>
				<td>{$invoiceItem.product.description|htmlsafe}</td>
				<td class="" colspan="4"></td>
			</tr>
			
			<tr class="">
				<td class="" ></td>
				<td class=""></td>
				<td class=""></td>
				<td class=""></td>
				<td align="right" class="">{$invoiceItem.unit_price|siLocal_number}&nbsp;{$preference.pref_currency_sign}</td><!-- sign: Misho-->
				<td align="right" class="">{$invoiceItem.total|siLocal_number}&nbsp;{$preference.pref_currency_sign}</td><!-- sign: Misho-->
			</tr>
			{/foreach}
	{/if}
	
	{if $invoice.type_id == 1 }
		    <table class="left" width="100%">

                <tr class="col1" >
                    <td class="tbl1-bottom col1" colspan="6"><b>{$LANG.description}</b></td>
                </tr>
                
          {foreach from=$invoiceItems item= invoiceItem}

			    <tr class="">
                    <td class="t" colspan="6">{$invoiceItem.description|outhtml}</td>
                </tr>

		{/foreach}
	{/if}

</table>
    
<br/ >
<br/ >
	<!-- invoice details section - start -->
	<table align="left" width="50%">
		<tr>
		    <td >Срок на плащане:</td>
			<td >{$preference.pref_inv_detail_line|outhtml}</td>
		</tr>
		<tr>
			<td>{$customFieldLabels.invoice_cf3|htmlsafe}:</td>
			<td>{$invoice.custom_field3|htmlsafe}</td>
		</tr>
		<tr>
			<td>{$preference.pref_inv_payment_line1_name|htmlsafe}:</td> 
			<td>{$preference.pref_inv_payment_line1_value|htmlsafe}</td>
		</tr>
		<tr>
			<td>{$customFieldLabels.biller_cf3}:</td> <!--IBAN / BIC-->
			<td>{$biller.custom_field3}</td>
		</tr>
    </table>
	<!-- invoice details section - end -->
	
	{* tax section - start *}
	<table align="right" width ="50%">
		{if $invoice_number_of_taxes > 0}
			<tr>
				<td colspan="2"></td>
				<td colspan="3" align="right">{$LANG.sub_total}:&nbsp;</td>
				<td colspan="1" align="right">{if $invoice_number_of_taxes > 1}<u>{/if}{$invoice.gross|siLocal_number}&nbsp;{$preference.pref_currency_sign|htmlsafe}{if $invoice_number_of_taxes > 1}</u>{/if}</td>
			</tr>
			<tr>
				<td colspan="2"></td>
				<td colspan="3" align="right">ДАН.ОСНОВА:&nbsp;</td>
				<td colspan="1" align="right">{if $invoice_number_of_taxes > 1}<u>{/if}{$invoice.gross|siLocal_number}&nbsp;{$preference.pref_currency_sign|htmlsafe}{if $invoice_number_of_taxes > 1}</u>{/if}</td>
			</tr>
        {/if}
		{section name=line start=0 loop=$invoice.tax_grouped step=1}
			{if ($invoice.tax_grouped[line].tax_amount != "0") }
				<tr>
					<td colspan="2"></td>
					<td colspan="3" align="right">{$invoice.tax_grouped[line].tax_name|htmlsafe}:&nbsp;</td>
					<td colspan="1" align="right">{$invoice.tax_grouped[line].tax_amount|siLocal_number}&nbsp;{$preference.pref_currency_sign|htmlsafe}</td>
				</tr>
			{/if}
		{/section}
		<tr>
		    <td colspan="2"></td>
			<td colspan="3" align="right">{$preference.pref_inv_wording|htmlsafe} {$LANG.amount}:&nbsp;</td>
			<td colspan="1" align="right">{$invoice.total|siLocal_number}&nbsp;{$preference.pref_currency_sign|htmlsafe}</td>
		</tr>
    </table>
	{* tax section - end *}

	<table align="left">
		<tr>
			<td ><br /><br /><br /></td>
		</tr>
		<th>
			<td >ПЛАЩАНЕТО, СТОКАТА / УСЛУГАТА СА ПОЛУЧЕНИ ОТ</td>
		</th>
		<tr>
			<td>{$customFieldLabels.invoice_cf2|htmlsafe}:</td>
			<td>{$invoice.custom_field2|htmlsafe}</td>
		</tr>
		<tr>
			<td>Подпис:</td>
			<td>................</td>
		</tr>
	</table>
	
	<table align="right">
		<tr>
			<td ><br /><br /><br /></td>
		</tr>
		<th>
			<td >СЪСТАВИЛ</td>
		</th>
		<tr>
			<td>{$customFieldLabels.invoice_cf1|htmlsafe}:</td>
			<td>{$invoice.custom_field1|htmlsafe}</td>
		</tr>
		<tr>
			<td>Подпис и печат:</td>
			<td>................</td>
		</tr>
	</table>
	
	
	<!--invoice notes start-->
	<!--{if ($invoice.type_id == 2 && $invoice.note != "") || ($invoice.type_id == 3 && $invoice.note != "" )  } {/if}-->
	<table align="left" width="100%">
		<tr>
			<td ><br /><br /></td>
		</tr>
		<tr>
			<td>{$LANG.notes}:</td>
		</tr>
		<tr>
			<td>{$invoice.note|outhtml}</td>
		</tr>
	</table>
	
	<!--invoice notes end-->

<div id="footer"></div>

</div>

</body>
</html>
