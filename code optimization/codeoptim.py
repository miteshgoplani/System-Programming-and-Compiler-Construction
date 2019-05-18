def getprog():
	count = 1
	lines = []
	eachline = input(str(count)+" : ")
	while eachline!='exit':
		lines.append(eachline)
		count+=1
		eachline = input(str(count)+" : ")
	l=[]
	r=[]
	for eachline in lines:
		temp = eachline.split('=')
		lhs = temp[0]
		rhs = temp[1]
		l.append(lhs)
		r.append(rhs)
	return {key: value for (key, value) in zip(l,r)}

def optimize(dic):
	l = list(dic.keys())
	r = list(dic.values())
	replace_list = dict()
	for i in range(len(r)):
		elem = r[i]
		if elem in r[:i]:
		    j = r[:i].index(elem)
		replace = l[i]
		replace_by = l[j]
		replace_list[replace] = replace_by
	for lhs,rhs in zip(l,r) :
        i = r.index(rhs)
        j = l.index(lhs)
        for repelem in replace_list.keys():
            if repelem in rhs :
                rhs = rhs.replace(repelem, replace_list[repelem])
                r[i] = rhs
            if repelem in lhs :
                lhs = lhs.replace(repelem, replace_list[repelem])
                l[j] = lhs
            d = {key: value for (key, value) in zip(l,r)}
	return d, replace_list
	
if __name__ == '__main__':	
	dic = getprog()
	while True:
		dic, r = optimize(dic)
		if len(r)==0:
			break
	print("\nThe optimized intermediate code is : \n")
	for key in dic:
		print(key+"="+dic[key])
