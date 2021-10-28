import { useEffect, useState } from 'react'
import axios from 'axios'

/**
 * fetchList
 * requestUrl 请求地址
 * queryParams 请求参数
 * withLoading 是否携带 loading
 * fetchDependence 依赖 => 可以根据地址栏解析拉取列表
 */
export default function useGetNumber() {
  const [number, setNumber] = useState('11111111')

  useEffect(() => {
    fetchDataList()
  }, [])

  function fetchDataList() {
    axios
      .get('http://120.27.27.42:9001/stm32/device_data/get_device_data?sn=280379760058405')
      .then(function (response) {
        // 处理成功情况
        setNumber(response.data.value)
      })
  }
  console.log('number', number)
  const resTem = number.slice(4, 6)
  const humTem = number.slice(6, 8)
  return {
    resTem,
    humTem
  }
}
