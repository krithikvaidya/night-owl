from django import template
register=template.Library()

@register.simple_tag
def sort_by_filter(in_list):
    maxim=0
    out_list=[]
    for items in in_list:
        if items.filter.id>maxim:
            maxim=items.filter.id

    for i in range(maxim):
        out_list+=[[]]

    for items in in_list:
        out_list[items.filter.id-1].append(items)

    return out_list

@register.filter
def sort_by_price(in_list):
    for i in range(len(in_list)-1):
        min=in_list[i].price
        index=i
        for j in range(i+1,len(in_list)):
            if(in_list[j].price<min):
                min=in_list[j].price
                index=j

        temp=in_list[index].price
        in_list[index].price=in_list[i].price
        in_list[i].price=temp

    return in_list

@register.filter
def findncnumber(indict):
    return indict.get('ncnumber', -1)

@register.filter
def tostring(item_id):
    return str(item_id)