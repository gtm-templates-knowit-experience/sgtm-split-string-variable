# Split String - SGTM Variable
Variable Template (Server) for Google Tag Manager for splitting a string. You can split by first, last or Nth occurrence. Result can be the split result itself, complete string or limited string returned.

This Template is available in the [**Google Tag Manager Template Gallery**](https://tagmanager.google.com/gallery/#/owners/gtm-templates-knowit-experience/templates/sgtm-split-string-variable).

![Split String SGTM Variable](https://github.com/gtm-templates-knowit-experience/sgtm-split-string-variable/blob/main/images/sgtm-split-string-variable.png)

## Delimiter
* Type in a delimiter for splitting the string
  * To split a string based spaces in the string, type **space** as delimiter
* Regular Expression splitting is not supported

## Select Occurence to Return
You can split the string using the following methods:
* First Occurrence
* Last Occurrence
* Nth Occurrence from Start of string
  * The first occurence is **0** when counting delimiters from the start of string
* Nth Occurence from End of string
  * The first occurence is **1** when counting delimiters from the end of string

## Enhanced Split Result
When splitting a string, only the first result is normally returned.
If **the-quick-brown-fox-jumps-over-the-lazy-dog** is your string, and you split on **First Occurence**, the result returned is **the**.

With **enhanced result** settings, you can either return the **complete string** after the split, or a **limited string**.

### Return Complete String after Split
If selected, the complete string after the split will be returned.

E.g. if your string is **the-quick-brown-fox-jumps-over-the-lazy-dog**, and you split using **-** (hyphen) at occurence **2**, the value returned is **brown-fox-jumps-over-the-lazy-dog**.

### Limit Complete String Returned 
If selected, the complete string after the split will be limited.

E.g. if your string is **the-quick-brown-fox-jumps-over-the-lazy-dog**, and you split using **-** (hyphen) at occurence **2**, and the limitation number is set to **3**, the value returned is **brown-fox-jumps**.
