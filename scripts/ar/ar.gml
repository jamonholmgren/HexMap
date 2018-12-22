var arr = array_create(argument_count);
for(i = 0; i < argument_count; i++) {
	arr[i] = split(argument[i], ",");
}
return arr;
