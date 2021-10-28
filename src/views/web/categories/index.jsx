import React, { useState } from 'react'
import './index.less'
// import { useSelector } from 'react-redux'
// import axios from 'axios'
import useFetchList from '@/hooks/useFetchList'
import { HOME_PAGESIZE } from '@/utils/config'
import getNumber from '@/utils/getNumbers'
import { Badge, Tag } from 'antd'
import { Link } from 'react-router-dom'

function Categories(props) {
  // const categoryList = useSelector(state => state.article.categoryList)
  const { dataList } = useFetchList({
    requestUrl: '/article/list',
    queryParams: { pageSize: HOME_PAGESIZE },
    fetchDependence: [props.location.search]
  })
  const { resTem, humTem } = getNumber()
  console.log(resTem, humTem)
  return (
    <div className='app-categories'>
      <h2 className='title'>Categories</h2>
      <p className='category-all-title'>{`${dataList.length} categories in total`}</p>

      <div className='categories-list'>
        {dataList.map((item, i) => (
          <Badge key={item.title}>
            <Tag>
              <Link to={`/categories/${item.title}`}>{item.title}</Link>
              <div>室内温度：{resTem }</div>
              <div>人体温度：{ humTem }</div>
            </Tag>
          </Badge>
        ))}
      </div>
    </div>
  )
}

export default Categories
